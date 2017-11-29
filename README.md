# CLISpinner

[![Travis](https://img.shields.io/travis/kiliankoe/CLISpinner.svg?style=flat-square)](https://travis-ci.org/kiliankoe/CLISpinner/)

> 60+ spinners for use in the terminal

![](https://github.com/sindresorhus/cli-spinners/raw/master/screenshot.gif)

Shamelessly ripped off from [sindresorhus/cli-spinners](https://github.com/sindresorhus/cli-spinners).



## Install

```swift
.package(url: "https://github.com/kiliankoe/CLISpinner", from: "see latest release")
```



## Usage

Just want to display a simple spinner for two seconds? 

```swift
let s = Spinner(pattern: .dots)
s.start()
sleep(2)
s.stop()
```

Want some changing text and patterns?

```swift
let s = Spinner(pattern: .dots, text: "Foobar...", color: .lightCyan)
s.start()
sleep(2)
s.succeed(text: "Barfoo")
// will change the displayed text to '✔ Barfoo'
```



That's basically it 👌



## Caveat

To look *nice* the spinner hides the user's cursor as long as it's running and displays it again when stopped. The issue with this is that the cursor will still be hidden if the user interrupts the process (by sending a SIGINT through ^c for example). The best way to handle this is by setting up a signal handler in your code and calling `spinner.unhideCursor()` on exiting. This library purposefully does not do that for you so as not to interfere with any possible signal handlers you might already have set up.

See [IBM-Swift/BlueSignals](https://github.com/IBM-Swift/BlueSignals) for a clean and safe way of handling signals. The appropriate signal handler for your project could look something like this.

```swift
import Signals

let spinner = Spinner(pattern: .dots)
// ...

Signals.trap(signal: .int) { _ in
    spinner.unhideCursor()
    exit(0)
}
```



## Used by

- [kiliankoe/apodidae](https://github.com/kiliankoe/apodidae) - CLI to search for Swift packages
- [Swift-Watch/Watcher](https://github.com/Swift-Watch/Watcher) - file watcher and test runner for Swift projects
- Your project? 😊
