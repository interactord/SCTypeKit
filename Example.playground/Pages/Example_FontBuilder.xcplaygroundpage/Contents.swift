//: [Previous](@previous)
import UIKit
import PlaygroundSupport
import SCTypeKit

let container = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 200))
let view = UILabel(frame: container.frame)

view.numberOfLines = 1
view.text = "I watched the storm, so beautiful yet terrific."
view.textAlignment = .center
view.font = FontBuilder()
  .fontName("Noteworthy-Bold ")
  .fontSize(20)
  .build()

container.addSubview(view)

PlaygroundPage.current.liveView = container
PlaygroundPage.current.needsIndefiniteExecution = true
