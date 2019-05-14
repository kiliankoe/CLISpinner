public protocol SpinnerPattern {
    var frames: [String] { get }
    var speed: Double { get }
}

// Props go to https://github.com/sindresorhus/cli-spinners
public struct Pattern: SpinnerPattern, Decodable {
    public let frames: [String]
    public let speed: Double

    public static let dots = Pattern(frames: "⠋","⠙","⠹","⠸","⠼","⠴","⠦","⠧","⠇","⠏", speed: 0.08)
    public static let dots2 = Pattern(frames: "⣾","⣽","⣻","⢿","⡿","⣟","⣯","⣷", speed: 0.08)
    public static let dots3 = Pattern(frames: "⠋","⠙","⠚","⠞","⠖","⠦","⠴","⠲","⠳","⠓", speed: 0.08)
    public static let dots4 = Pattern(frames: "⠄","⠆","⠇","⠋","⠙","⠸","⠰","⠠","⠰","⠸","⠙","⠋","⠇","⠆", speed: 0.08)
    public static let dots5 = Pattern(frames: "⠋","⠙","⠚","⠒","⠂","⠂","⠒","⠲","⠴","⠦","⠖","⠒","⠐","⠐","⠒","⠓","⠋", speed: 0.08)
    public static let dots6 = Pattern(frames: "⠁","⠉","⠙","⠚","⠒","⠂","⠂","⠒","⠲","⠴","⠤","⠄","⠄","⠤","⠴","⠲","⠒","⠂","⠂","⠒","⠚","⠙","⠉","⠁", speed: 0.08)
    public static let dots7 = Pattern(frames: "⠈","⠉","⠋","⠓","⠒","⠐","⠐","⠒","⠖","⠦","⠤","⠠","⠠","⠤","⠦","⠖","⠒","⠐","⠐","⠒","⠓","⠋","⠉","⠈", speed: 0.08)
    public static let dots8 = Pattern(frames: "⠁","⠁","⠉","⠙","⠚","⠒","⠂","⠂","⠒","⠲","⠴","⠤","⠄","⠄","⠤","⠠","⠠","⠤","⠦","⠖","⠒","⠐","⠐","⠒","⠓","⠋","⠉","⠈","⠈", speed: 0.08)
    public static let dots9 = Pattern(frames: "⢹","⢺","⢼","⣸","⣇","⡧","⡗","⡏", speed: 0.08)
    public static let dots10 = Pattern(frames: "⢄","⢂","⢁","⡁","⡈","⡐","⡠", speed: 0.08)
    public static let dots11 = Pattern(frames: "⠁","⠂","⠄","⡀","⢀","⠠","⠐","⠈", speed: 0.1)
    public static let dots12 = Pattern(frames: "⢀⠀","⡀⠀","⠄⠀","⢂⠀","⡂⠀","⠅⠀","⢃⠀","⡃⠀","⠍⠀","⢋⠀","⡋⠀","⠍⠁","⢋⠁","⡋⠁","⠍⠉","⠋⠉","⠋⠉","⠉⠙","⠉⠙","⠉⠩","⠈⢙","⠈⡙","⢈⠩","⡀⢙","⠄⡙","⢂⠩","⡂⢘","⠅⡘","⢃⠨","⡃⢐","⠍⡐","⢋⠠","⡋⢀","⠍⡁","⢋⠁","⡋⠁","⠍⠉","⠋⠉","⠋⠉","⠉⠙","⠉⠙","⠉⠩","⠈⢙","⠈⡙","⠈⠩","⠀⢙","⠀⡙","⠀⠩","⠀⢘","⠀⡘","⠀⠨","⠀⢐","⠀⡐","⠀⠠","⠀⢀","⠀⡀", speed: 0.08)

    public static let line = Pattern(frames: "-","\\","|","/", speed: 0.13)
    public static let line2 = Pattern(frames: "⠂","-","–","—","–","-", speed: 0.1)

    public static let pipe = Pattern(frames: "┤","┘","┴","└","├","┌","┬","┐", speed: 0.1)

    public static let simpleDots = Pattern(frames: ".  ",".. ","...","   ", speed: 0.4)
    public static let simpleDotsScrolling = Pattern(frames: ".  ",".. ","..."," ..","  .","   ", speed: 0.2)

    public static let star = Pattern(frames: "✶","✸","✹","✺","✹","✷", speed: 0.7)
    public static let star2 = Pattern(frames: "+","x","*", speed: 0.8)

    public static let flip = Pattern(frames: "_","_","_","-","`","`","'","´","-","_","_","_", speed: 0.7)

    public static let hamburger = Pattern(frames: "☱","☲","☴", speed: 0.1)

    public static let growVertical = Pattern(frames: "▁","▃","▄","▅","▆","▇","▆","▅","▄","▃", speed: 0.12)
    public static let growHorizontal = Pattern(frames: "▏","▎","▍","▌","▋","▊","▉","▊","▋","▌","▍","▎", speed: 0.12)

    public static let balloon = Pattern(frames: " ",".","o","O","@","*"," ", speed: 0.14)
    public static let balloon2 = Pattern(frames: ".","o","O","°","O","o",".", speed: 0.12)

    public static let noise = Pattern(frames: "▓","▒","░", speed: 0.1)

    public static let bounce = Pattern(frames: "⠁","⠂","⠄","⠂", speed: 0.12)
    public static let boxBounce = Pattern(frames: "▖","▘","▝","▗", speed: 0.12)
    public static let boxBounce2 = Pattern(frames: "▌","▀","▐","▄", speed: 0.1)

    public static let triangle = Pattern(frames: "◢","◣","◤","◥", speed: 0.05)

    public static let arc = Pattern(frames: "◜","◠","◝","◞","◡","◟", speed: 0.1)
    public static let circle = Pattern(frames: "◡","⊙","◠", speed: 0.12)
    public static let squareCorners = Pattern(frames: "◰","◳","◲","◱", speed: 0.18)
    public static let circleQuarters = Pattern(frames: "◴","◷","◶","◵", speed: 0.12)
    public static let circleHalves = Pattern(frames: "◐","◓","◑","◒", speed: 0.05)

    public static let squish = Pattern(frames: "╫","╪", speed: 0.1)

    public static let toggle = Pattern(frames: "⊶","⊷", speed: 0.25)
    public static let toggle2 = Pattern(frames: "▫","▪", speed: 0.08)
    public static let toggle3 = Pattern(frames: "□","■", speed: 0.12)
    public static let toggle4 = Pattern(frames: "■","□","▪","▫", speed: 0.1)
    public static let toggle5 = Pattern(frames: "▮","▯", speed: 0.1)
    public static let toggle6 = Pattern(frames: "ဝ","၀", speed: 0.3)
    public static let toggle7 = Pattern(frames: "⦾","⦿", speed: 0.08)
    public static let toggle8 = Pattern(frames: "◍","◌", speed: 0.1)
    public static let toggle9 = Pattern(frames: "◉","◎", speed: 0.1)
    public static let toggle10 = Pattern(frames: "㊂","㊀","㊁", speed: 0.1)
    public static let toggle11 = Pattern(frames: "⧇","⧆", speed: 0.1)
    public static let toggle12 = Pattern(frames: "☗","☖", speed: 0.12)
    public static let toggle13 = Pattern(frames: "=","*","-", speed: 0.08)

    public static let arrow = Pattern(frames: "←","↖","↑","↗","→","↘","↓","↙", speed: 0.1)
    public static let arrow2 = Pattern(frames: "⬆️ ","↗️ ","➡️ ","↘️ ","⬇️ ","↙️ ","⬅️ ","↖️ ", speed: 0.08)
    public static let arrow3 = Pattern(frames: "▹▹▹▹▹","▸▹▹▹▹","▹▸▹▹▹","▹▹▸▹▹","▹▹▹▸▹","▹▹▹▹▸", speed: 0.12)

    public static let bouncingBar = Pattern(frames: "[    ]","[   =]","[  ==]","[ ===]","[====]","[=== ]","[==  ]","[=   ]", speed: 0.08)
    public static let bouncingBall = Pattern(frames: "( ●    )","(  ●   )","(   ●  )","(    ● )","(     ●)","(    ● )","(   ●  )","(  ●   )","( ●    )","(●     )", speed: 0.08)

    public static let smiley = Pattern(frames: "😄 ","😝 ", speed: 0.2)
    public static let monkey = Pattern(frames: "🙈 ","🙈 ","🙉 ","🙊 ", speed: 0.3)
    public static let hearts = Pattern(frames: "💛 ","💙 ","💜 ","💚 ","❤️ ", speed: 0.1)
    public static let clock = Pattern(frames: "🕐 ","🕑 ","🕒 ","🕓 ","🕔 ","🕕 ","🕖 ","🕗 ","🕘 ","🕙 ","🕚 ", speed: 0.1)
    public static let earth = Pattern(frames: "🌍 ","🌎 ","🌏 ", speed: 0.18)
    public static let moon = Pattern(frames: "🌑 ","🌒 ","🌓 ","🌔 ","🌕 ","🌖 ","🌗 ","🌘 ", speed: 0.08)
    public static let runner = Pattern(frames: "🚶 ","🏃 ", speed: 0.14)

    public static let pong = Pattern(frames: "▐⠂       ▌","▐⠈       ▌","▐ ⠂      ▌","▐ ⠠      ▌","▐  ⡀     ▌","▐  ⠠     ▌","▐   ⠂    ▌","▐   ⠈    ▌","▐    ⠂   ▌","▐    ⠠   ▌","▐     ⡀  ▌","▐     ⠠  ▌","▐      ⠂ ▌","▐      ⠈ ▌","▐       ⠂▌","▐       ⠠▌","▐       ⡀▌","▐      ⠠ ▌","▐      ⠂ ▌","▐     ⠈  ▌","▐     ⠂  ▌","▐    ⠠   ▌","▐    ⡀   ▌","▐   ⠠    ▌","▐   ⠂    ▌","▐  ⠈     ▌","▐  ⠂     ▌","▐ ⠠      ▌","▐ ⡀      ▌","▐⠠       ▌", speed: 0.08)

    public static let shark = Pattern(frames: "▐|\\____________▌","▐_|\\___________▌","▐__|\\__________▌","▐___|\\_________▌","▐____|\\________▌","▐_____|\\_______▌","▐______|\\______▌","▐_______|\\_____▌","▐________|\\____▌","▐_________|\\___▌","▐__________|\\__▌","▐___________|\\_▌","▐____________|\\▌","▐____________/|▌","▐___________/|_▌","▐__________/|__▌","▐_________/|___▌","▐________/|____▌","▐_______/|_____▌","▐______/|______▌","▐_____/|_______▌","▐____/|________▌","▐___/|_________▌","▐__/|__________▌","▐_/|___________▌","▐/|____________▌", speed: 0.12)

    public static let dqpb = Pattern(frames: "d","q","p","b", speed: 0.1)

    public static func single(_ pattern: String, speed: Double = 1.0) -> Pattern {
        return .init(single: pattern)
    }

    public static func multiple(_ pattern: String..., speed: Double = 0.08) -> Pattern {
        return .multiple(pattern, speed: speed)
    }
    public static func multiple(_ pattern: [String], speed: Double = 0.08) -> Pattern {
        return .init(frames: pattern, speed: speed)
    }

    /// Creates a pattern from a single value, e.g. no animation.
    ///
    /// - Parameter single: the string to show as the spinner
    public init(single: String, speed: Double = 1.0) {
        self.init(frames: single, speed: speed)
    }

    public init(frames: String..., speed: Double) {
        self.init(frames: frames, speed: speed)
    }

    public init(frames: [String], speed: Double) {
        self.frames = frames
        self.speed = speed
    }
}
