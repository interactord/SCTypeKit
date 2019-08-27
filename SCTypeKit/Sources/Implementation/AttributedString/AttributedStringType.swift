//
// Created by Scott Moon on 27/08/2019.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import Foundation

public enum AttributedType {

  /// NSFontAttributeName
  case font(UIFont)

  /// NSParagraphStyleAttributeName
  case paragraphStyle(NSParagraphStyle)

  /// NSForegroundColorAttributeName
  case textColor(UIColor?)

  /// NSBackgroundColorAttributeName
  case backgroundColor(UIColor?)

  /// NSLigatureAttributeName
  case ligature(Bool)

  /// NSKernAttributeName
  case kerning(CGFloat)
  case letterSpacing(CGFloat)

  /// NSStrikethroughStyleAttributeName
  case strikethrough(Bool)

  /// NSUnderlineStyleAttributeName
  case underline(Bool)

  /// NSStrokeColorAttributeName
  case strokeColor(UIColor)

  /// NSStrokeWidthAttributeName
  case strokeWidth(CGFloat)

  // NSShadowAttributeName
  case shadow(NSShadow?)

  /// NSBaselineOffsetAttributeName
  case baselineOffset(CGFloat)

  /// NSUnderlineColorAttributeName
  case underlineColor(UIColor?)

  /// NSStrikethroughColorAttributeName
  case strikethroughColor(UIColor?)

  /// NSObliquenessAttributeName
  case skew(CGFloat)

  // NSExpansionAttributeName
  case expansion(CGFloat)

  // NSParagraphStyle
  case alignment(NSTextAlignment)
  case lineSpacing(CGFloat)

  var key: NSAttributedString.Key {
    return keyAndValue(for: self).0
  }

  var value: Any? {
    return keyAndValue(for: self).1
  }

  private func keyAndValue(for type: AttributedType) -> (NSAttributedString.Key, Any?) {

    switch type {
    case .font(let value):
      return (key: .font, value: value)
    case .paragraphStyle(let value):
      return (key: .paragraphStyle, value: value)
    case .textColor(let value):
      return (key: .foregroundColor, value: value)
    case .backgroundColor(let value):
      return (key: .backgroundColor, value: value)
    case .ligature(let value):
      return (key: .ligature, value: value)
    case .kerning(let value):
      return (key: .kern, value: value)
    case .letterSpacing(let value):
      return (key: .kern, value: value)
    case .strikethrough(let value):
      return (key: .strikethroughStyle, value: value)
    case .strikethroughColor(let value):
      return (key: .strikethroughColor, value: value)
    case .strokeColor(let value):
      return (key: .strokeColor, value: value)
    case .strokeWidth(let value):
      return (key: .strokeWidth, value: value)
    case .underline(let value):
      return (key: .underlineStyle, value: value)
    case .underlineColor(let value):
      return (key: .underlineColor, value: value)
    case .shadow(let value):
      return (key: .shadow, value: value)
    case .baselineOffset(let value):
      return (key: .baselineOffset, value: value)
    case .skew(let value):
      return (key: .obliqueness, value: value)
    case .expansion(let value):
      return (key: .expansion, value: value)
    case .alignment:
      return (.paragraphStyle, nil)
    case .lineSpacing:
      return (.paragraphStyle, nil)
    }

  }

  private func configureParagraph(_ configure: (NSMutableParagraphStyle) -> Void) -> NSMutableParagraphStyle {
    let style = NSMutableParagraphStyle()
    configure(style)
    return style
  }

  func configureParagraphStyle(_ par: NSMutableParagraphStyle) {

    switch self {
    case .paragraphStyle(let value):
      par.setParagraphStyle(value)
    case .alignment(let value):
      par.alignment = value
    case .lineSpacing(let value):
      par.lineSpacing = value
    default:
      break
    }

  }
}
