import XCTest
import class Foundation.NSRegularExpression
import func Foundation.NSMakeRange
@testable import CLISpinner

class CLISpinnerTests: XCTestCase {

    func testState() {
        let s = Spinner(pattern: .dots, text: "start text")
        s.start()

        XCTAssertEqual(s.isRunning, true)
        XCTAssertEqual(s.text, "start text")

        s.stop(text: "stop text", symbol: "S")

        XCTAssertEqual(s.isRunning, false)
        XCTAssertEqual(s.text, "stop text ")
        XCTAssertEqual(s.frames, ["S"])
    }

    func testText() {
        let s = Spinner(pattern: .dots)
        s.text = "foobar"
        XCTAssertEqual(s.text, "foobar")
        s.text = "something longer"
        XCTAssertEqual(s.text, "something longer")
        s.text = "shorter"
        XCTAssertEqual(s.text, "shorter         ")
    }

    func testFrame() {
        let p = Pattern.multiple(["a", "b", "c"])
        let s = Spinner(pattern: p)

        XCTAssertEqual(s.frame().cleanString(), "a ")
        XCTAssertEqual(s.frame().cleanString(), "b ")
        XCTAssertEqual(s.frame().cleanString(), "c ")
        XCTAssertEqual(s.frame().cleanString(), "a ")
    }

//    func testExample() {
//        let s = Spinner(pattern: .dots, text: "Searching...", color: .lightCyan)
//        s.start()
//        sleep(2)
//        s.succeed(text: "Found 5 results")
//        print()
//    }

    func testLoadPattern() {
        let path = #file.components(separatedBy: "/").dropLast().joined(separator: "/") + "/grenade.json"
        let pattern: CLISpinner.Pattern
        do {
            pattern = try .load(from: path)
        } catch {
            XCTFail("Failed to initialize Patterns from \(path) with error: \(type(of: error)).\(error)")
            return
        }

        let s = Spinner(pattern: pattern)
        XCTAssertEqual(s.frames.map({ $0.cleanString() }), ["،   ", "′   ", " ´ ", " ‾ ", "  ⸌", "  ⸊", "  |", "  ⁎", "  ⁕", " ෴ ", "  ⁓", "   ","   ", "   "])
        XCTAssertEqual(s.speed, 0.08)
    }

    func testLoadPatterns() {
        let path = #file.components(separatedBy: "/").dropLast().joined(separator: "/") + "/spinners.json"
        let patterns: Patterns
        do {
            patterns = try .init(from: path)
        } catch {
            XCTFail("Failed to initialize Patterns from \(path) with error: \(type(of: error)).\(error)")
            return
        }

        let s = Spinner(pattern: patterns["layer"]!)
        XCTAssertEqual(s.frames.map({ $0.cleanString() }), ["-", "=", "≡"])
        XCTAssertEqual(s.speed, 0.15)
    }

    static var allTests = [
        ("testState", testState),
        ("testText", testText),
        ("testFrame", testFrame),
        ("testLoadPattern", testLoadPattern),
        ("testLoadPatterns", testLoadPatterns),
    ]
}

private var cleanRegex = try! NSRegularExpression(pattern: "(\u{009B}|\u{001B})\\[[0-?]*[ -\\/]*[@-~]", options: .caseInsensitive)
fileprivate extension String {
    func cleanString() -> String? {
        return cleanRegex.stringByReplacingMatches(in: self, range: NSMakeRange(0, count), withTemplate: "")
    }
}
