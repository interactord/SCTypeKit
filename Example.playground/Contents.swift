//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import SCTypeKit

let container = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
let view = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
view.text = "Hello world"
view.font = FontBuilder().fontName("vernada").build()

container.addSubview(view)

PlaygroundPage.current.liveView = container
PlaygroundPage.current.needsIndefiniteExecution = true
