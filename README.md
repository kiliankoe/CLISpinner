# CLISpinner

> 60+ spinners for use in the terminal

![](https://github.com/sindresorhus/cli-spinners/raw/master/screenshot.gif)

Shamelessly ripped of from [sindresorhus/cli-spinners](https://github.com/sindresorhus/cli-spinners).



## Install

```swift
.package(url: "https://github.com/kiliankoe/CLISpinner", from: "0.1.0")
```



## Usage

Just want to display a spinner for two seconds? 

```swift
let s = Spinner(pattern: .dots)
s.start()
sleep(2)
s.end()
```

Want some changing text and and patterns?

```swift
let s = Spinner(pattern: .dots, text: "Foobar...")
s.start()
sleep(2)
s.text = "Barfoo..."
s.pattern = Pattern(from: "✔︎")
sleep(1)
s.end()
```



That's basically it 👌