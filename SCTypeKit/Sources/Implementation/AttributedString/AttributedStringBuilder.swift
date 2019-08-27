//
// Created by Scott Moon on 27/08/2019.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import UIKit

public class AttributedStringBuilder {

  // MARK: - Properties

  private var baseAttributedString = NSMutableAttributedString()
  public var defaultAttributes = [AttributedType]()

  // MARK: - Method
  public init() { }

	public convenience init(attribute: [AttributedType]) {
		self.init()
		defaultAttributes = attribute
	}

  private func attributesDictionary(with overrides: [AttributedType]) -> [NSAttributedString.Key: Any] {

    var attributeDic = [NSAttributedString.Key: Any]()
    let paragraphStyle = NSMutableParagraphStyle()

    (defaultAttributes + overrides).forEach {

      let key = $0.key
      let value = $0.value

      key == .paragraphStyle
        ? $0.configureParagraphStyle(paragraphStyle)
        : (attributeDic[key] = value)
    }
    attributeDic[.paragraphStyle] = paragraphStyle
    return attributeDic
  }

  @discardableResult
  public func clear() -> AttributedStringBuilder {
    defaultAttributes.removeAll()
    return self
  }

  @discardableResult
  public func append(attachment: NSTextAttachment) -> AttributedStringBuilder {
    baseAttributedString.append(
      NSAttributedString(attachment: attachment)
    )
    return self
  }

  @discardableResult
  public func append(_ attributedString: NSAttributedString) -> AttributedStringBuilder {
    baseAttributedString.append(attributedString)
    return self
  }

}

// MARK: - Strings
extension AttributedStringBuilder {

  @discardableResult
  public func text(_ string: String, attributes: [AttributedType] = []) -> AttributedStringBuilder {
    let attributes = attributesDictionary(with: attributes)
    let attributedString = NSAttributedString(string: string, attributes: attributes)
    baseAttributedString.append(attributedString)
    return self
  }

  @discardableResult
  public func spaces(_ number: Int, attributes: [AttributedType] = []) -> AttributedStringBuilder {
    [0..<number].forEach { _ in
      space(attributes: attributes)
    }
    return self
  }

  @discardableResult
  public func space(attributes: [AttributedType] = []) -> AttributedStringBuilder {
    return text(" ", attributes: attributes)
  }

  @discardableResult
  public func newLines(_ number: Int, attributes: [AttributedType] = []) -> AttributedStringBuilder {
    [0..<number].forEach { _ in
      newLine(attributes: attributes)
    }
    return self
  }

  @discardableResult
  public func newLine(attributes: [AttributedType] = []) -> AttributedStringBuilder {
    return text("\n", attributes: attributes)
  }

  @discardableResult
  public func tabs(_ number: Int, attributes: [AttributedType] = []) -> AttributedStringBuilder {
    [0..<number].forEach { _ in
      tab(attributes: attributes)
    }
    return self
  }

  @discardableResult
  public func tab(attributes: [AttributedType] = []) -> AttributedStringBuilder {
    return text("\t", attributes: attributes)
  }

}

// MARK: - Images

extension AttributedStringBuilder {

  @discardableResult
  public func image(_ anImage: UIImage) -> AttributedStringBuilder {
    let attachment = NSTextAttachment()
    attachment.image = anImage
    return append(attachment: attachment)
  }

  @discardableResult
  public func image(_ anImage: UIImage, size: CGSize) -> AttributedStringBuilder {
    let attachment = NSTextAttachment()
    attachment.image = anImage
    attachment.bounds = .init(origin: .zero, size: size)
    return append(attachment: attachment)
  }

  @discardableResult
  public func image(_ anImage: UIImage, width: CGFloat) -> AttributedStringBuilder {
    let ratio = anImage.size.height / anImage.size.width
    let size = CGSize(width: width, height: width * ratio)
    return image(anImage, size: size)
  }

  @discardableResult
  public func image(_ anImage: UIImage, height: CGFloat) -> AttributedStringBuilder {
    let ratio = anImage.size.width / anImage.size.height
    let size = CGSize(width: height * ratio, height: height)
    return image(anImage, size: size)
  }

  @discardableResult
  public func image(_ anImage: UIImage, fitOfFontUppercase font: UIFont) -> AttributedStringBuilder {
    return image(anImage, height: font.capHeight)
  }

  @discardableResult
  public func image(_ anImage: UIImage, fitOfFontLowercase font: UIFont) -> AttributedStringBuilder {
    return image(anImage, height: font.xHeight)
  }

}

// MARK: - Builder

extension AttributedStringBuilder: Builder {

  public func build() -> NSAttributedString {
		clear()
    return baseAttributedString
  }

}
