import Foundation

public class Spinner {
    public let pattern: Pattern
    public var speed: Double
    var isRunning = true
    let queue = DispatchQueue(label: "io.kilian.CLISpinner")

    public init(with pattern: Pattern, speed: Double? = nil) {
        self.pattern = pattern
        self.speed = speed ?? pattern.recommendedSpeed
    }

    public func start() {
        hideCursor(true)
        isRunning = true
        queue.async { [weak self] in
            guard let `self` = self else { return }

            var idx = 0
            while self.isRunning {
                self.output(self.pattern.symbols[idx])
                idx += 1
                if !self.pattern.symbols.indices.contains(idx) {
                    idx = 0
                }
                self.wait(seconds: self.speed)
                self.output("\r")
            }
            self.output("\r")
        }
    }

    public func end() {
        self.isRunning = false
        hideCursor(false)
    }

    public func wait(seconds: Double) {
        usleep(useconds_t(seconds * 1_000_000))
    }

    func output(_ value: String) {
        print(value, terminator: "")
        fflush(stdout) // necessary for the carriage return in start()
    }

    func hideCursor(_ hide: Bool) {
        if hide {
            output("\u{001B}[?25l")
        } else {
            output("\u{001B}[?25h")
        }
    }
}

