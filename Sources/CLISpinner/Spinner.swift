import Foundation

public class Spinner {
    public var pattern: Pattern {
        didSet {
            self.frameIdx = 0
        }
    }
    public var speed: Double
    public var text: String {
        get {
            return self._text
        }
        set {
            if newValue.count < self._text.count {
                let diff = self._text.count - newValue.count
                self._text = newValue
                self._text += Array(repeating: " ", count: diff)
            } else {
                self._text = newValue
            }
        }
    }

    var _text = ""
    var isRunning = true
    var frameIdx = 0
    let queue = DispatchQueue(label: "io.kilian.CLISpinner")

    public init(pattern: Pattern, text: String = "", speed: Double? = nil) {
        self.pattern = pattern
        self._text = text
        self.speed = speed ?? pattern.recommendedSpeed
    }

    public func start() {
        hideCursor(true)
        isRunning = true
        queue.async { [weak self] in
            guard let `self` = self else { return }

            while self.isRunning {
                self.render()
                self.wait(seconds: self.speed)
            }
        }
    }

    public func stop(text: String? = nil, symbol: String? = nil) {
        if let text = text {
            self.text = text
        }
        if let symbol = symbol {
            self.pattern = Pattern(from: symbol)
        }
        self.render()
        self.isRunning = false
        hideCursor(false)
        print() // Ensure a newline after stopping
    }

    public func succeed(text: String? = nil) {
        self.stop(text: text, symbol: "✔")
    }

    public func fail(text: String? = nil) {
        self.stop(text: text, symbol: "✖")
    }

    public func warn(text: String? = nil) {
        self.stop(text: text, symbol: "⚠")
    }

    public func info(text: String? = nil) {
        self.stop(text: text, symbol: "ℹ")
    }

    func wait(seconds: Double) {
        usleep(useconds_t(seconds * 1_000_000))
    }

    func frame() -> String {
        let frame = self.pattern.symbols[self.frameIdx]
        self.frameIdx = (self.frameIdx + 1) % self.pattern.symbols.count
        return "\(frame) \(self._text)" // TODO: Support colors here, preferably separate for spinner and text
    }

    func resetCursor() {
        print("\r", terminator: "")
    }

    func render() {
        self.resetCursor()
        self.output(self.frame())
    }

    func output(_ value: String) {
        print(value, terminator: "")
        fflush(stdout) // necessary for the carriage return in start()
    }

    func hideCursor(_ hide: Bool) {
        if hide {
            self.output("\u{001B}[?25l")
        } else {
            self.output("\u{001B}[?25h")
        }
    }
}

