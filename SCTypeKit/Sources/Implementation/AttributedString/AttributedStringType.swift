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
  case lineBreakMode(NSLineBreakMode)

  var key: NSAttributedString.Key {
    return keyAndValue(for: self).0
  }

  var value: Any? {
    return keyAndValue(for: self).1
  }

  private func keyAndValue(for type: AttributedType) -> (NSAttributedString.Key, Any?) {
    switch type {
    case let .font(value):
      return (key: .font, value: value)
    case let .paragraphStyle(value):
      return (key: .paragraphStyle, value: value)
    case let .textColor(value):
      return (key: .foregroundColor, value: value)
    case let .backgroundColor(value):
      return (key: .backgroundColor, value: value)
    case let .ligature(value):
      return (key: .ligature, value: value)
    case let .kerning(value):
      return (key: .kern, value: value)
    case let .letterSpacing(value):
      return (key: .kern, value: value)
    case let .strikethrough(value):
      return (key: .strikethroughStyle, value: value)
    case let .strikethroughColor(value):
      return (key: .strikethroughColor, value: value)
    case let .strokeColor(value):
      return (key: .strokeColor, value: value)
    case let .strokeWidth(value):
      return (key: .strokeWidth, value: value)
    case let .underline(value):
      return (key: .underlineStyle, value: value)
    case let .underlineColor(value):
      return (key: .underlineColor, value: value)
    case let .shadow(value):
      return (key: .shadow, value: value)
    case let .baselineOffset(value):
      return (key: .baselineOffset, value: value)
    case let .skew(value):
      return (key: .obliqueness, value: value)
    case let .expansion(value):
      return (key: .expansion, value: value)
    case .alignment:
      return (.paragraphStyle, nil)
    case .lineSpacing:
      return (.paragraphStyle, nil)
    case .lineBreakMode:
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
    case let .paragraphStyle(value):
      par.setParagraphStyle(value)
    case let .alignment(value):
      par.alignment = value
    case let .lineSpacing(value):
      par.lineSpacing = value
    case let .lineBreakMode(value):
      par.lineBreakMode = value
    default:
      break
    }
  }
}
