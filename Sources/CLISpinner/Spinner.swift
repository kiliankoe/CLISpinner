import func Foundation.fflush
import let Foundation.stdout
import Rainbow
import Dispatch

public final class Spinner {
    /// The pattern the spinner uses.
    public var frames: [String] {
        willSet {
            frameIdx = newValue.startIndex
        }
    }
    /// The time to wait in seconds between each frame of the animation.
    public var speed: Double
    /// Text that is displayed right next to the spinner.
    public var text: String {
        get {
            return _text
        }
        set {
            let (_, _, _, newText) = Rainbow.extractModes(for: newValue)
            let (_, _, _, oldText) = Rainbow.extractModes(for: _text)
            let diff = oldText.count - newText.count
            if diff > 0 {
                _text = newValue
                _text += Array(repeating: " ", count: diff)
            } else {
                _text = newValue
            }
        }
    }

    private var _text = ""
    public private(set) var isRunning = true
    private var frameIdx: Array<String>.Index!
    private let queue = DispatchQueue(label: "io.kilian.CLISpinner")

    /// Create a new `Spinner`.
    ///
    /// - Parameters:
    ///   - pattern: The pattern to use.
    ///   - text: Text to display, defaults to none.
    ///   - speed: Custom speed value, defaults to a recommended value for each predefined pattern.
    ///   - color: Custom spinner color, defaults to .default.
    public init(pattern: SpinnerPattern, text: String = "", speed: Double? = nil, color: Color = .default) {
        frames = pattern.frames.map { $0.applyingColor(color) }
        _text = text
        self.speed = speed ?? pattern.speed
        frameIdx = frames.startIndex
    }

    /// Create a new `Spinner`.
    ///
    /// - Parameters:
    ///   - pattern: The pattern to use.
    ///   - text: Text to display, defaults to none.
    ///   - speed: Custom speed value, defaults to a recommended value for each predefined pattern.
    ///   - color: Custom spinner color, defaults to .default.
    public convenience init(pattern: Pattern, text: String = "", speed: Double? = nil, color: Color = .default) {
        self.init(pattern: pattern as SpinnerPattern, text: text, speed: speed, color: color)
    }

    /// Start the spinner.
    public func start() {
        guard !isRunning else { return }
        hideCursor(true)
        isRunning = true

        queue.async { [weak self] in
            guard let `self` = self else { return }
            self.renderForever()
        }
    }

    private func renderForever() {
        guard isRunning else { return }
        render()
        queue.asyncAfter(deadline: .now() + speed) { [weak self] in
            guard let `self` = self else { return }
            self.renderForever()
        }
    }

    /// Stop the spinner.
    ///
    /// - Parameters:
    ///   - text: Text to display as a final value when stopping.
    ///   - symbol: A symbol to replace the spinner with when stopping.
    ///   - terminator: The string to print after stopping. Defaults to newline ("\n").
    public func stop(text: String? = nil, symbol: String? = nil, terminator: String = "\n") {
        guard isRunning else { return }

        if let text = text {
            self.text = text
        }
        if let symbol = symbol {
            frames = [symbol.isEmpty ? " " : symbol]
        }
        render()
        isRunning = false
        hideCursor(false)
        print(terminator: terminator)
    }

    /// Stop the spinner and remove it entirely.
    public func stopAndClear() {
        guard isRunning else { return }

        stop(text: "", symbol: " ", terminator: "")
        output("\r")
    }

    /// Stop the spinner, change it to a green '✔' and persist the current or provided text.
    ///
    /// - Parameter text: Text to persist if not the one already set
    public func succeed(text: String? = nil) {
        stop(text: text, symbol: "✔".green)
    }

    /// Stop the spinner, change it to a red '✖' and persist the current or provided text.
    ///
    /// - Parameter text: Text to persist if not the one already set
    public func fail(text: String? = nil) {
        stop(text: text, symbol: "✖".red)
    }

    /// Stop the spinner, change it to a yellow '⚠' and persist the current or provided text.
    ///
    /// - Parameter text: Text to persist if not the one already set
    public func warn(text: String? = nil) {
        stop(text: text, symbol: "⚠".yellow)
    }

    /// Stop the spinner, change it to a blue 'ℹ' and persist the current or provided text.
    ///
    /// - Parameter text: Text to persist if not the one already set
    public func info(text: String? = nil) {
        stop(text: text, symbol: "ℹ".blue)
    }

    func frame() -> String {
        let frame = frames[frameIdx]
        frameIdx = (frameIdx + 1) % frames.count
        return "\(frame) \(_text)"
    }

    private func resetCursor() {
        print("\r", terminator: "")
    }

    private func render() {
        resetCursor()
        output(frame())
    }

    private func output(_ value: String) {
        print(value, terminator: "")
        fflush(stdout) // necessary for the carriage return in start()
    }

    private func hideCursor(_ hide: Bool) {
        if hide {
            output("\u{001B}[?25l")
        } else {
            output("\u{001B}[?25h")
        }
    }

    /// Unhide the cursor.
    ///
    /// - Note: This should most definitely be called on a SIGINT in your project.
    public func unhideCursor() {
        hideCursor(false)
    }

    deinit {
        unhideCursor()
    }
}

