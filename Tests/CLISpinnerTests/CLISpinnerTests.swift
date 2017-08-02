import XCTest
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
        XCTAssertEqual(s.pattern.symbols, ["S"])
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
        let p = Pattern(from: ["a", "b", "c"])
        let s = Spinner(pattern: p)

        XCTAssertEqual(s.frame(), "a ")
        XCTAssertEqual(s.frame(), "b ")
        XCTAssertEqual(s.frame(), "c ")
        XCTAssertEqual(s.frame(), "a ")
    }

//    func testExample() {
//        let s = Spinner(pattern: .dots, text: "Searching...", color: .lightCyan)
//        s.start()
//        sleep(2)
//        s.succeed(text: "Found 5 results")
//        print()
//    }

    static var allTests = [
        ("testState", testState),
        ("testText", testText),
        ("testFrame", testFrame),
    ]
}
