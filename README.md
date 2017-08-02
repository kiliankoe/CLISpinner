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