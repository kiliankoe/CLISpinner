# CLISpinner

> 60+ spinners for use in the terminal

![](https://github.com/sindresorhus/cli-spinners/raw/master/screenshot.gif)

Shamelessly ripped of from [sindresorhus/cli-spinners](https://github.com/sindresorhus/cli-spinners).



## Install

```swift
.package(url: "https://github.com/kiliankoe/CLISpinner", from: "0.1.0")
```



## Usage

```swift
let spinner = Spinner(with: .dots)
spinner.start()
sleep(2)
spinner.end()
```

You can also override the display speed, while it's running or not.
