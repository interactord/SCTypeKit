//
// Created by Scott Moon on 27/08/2019.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import UIKit

public class FontBuilder: Builder {

	private var ptSize: CGFloat = UIFont.systemFontSize
	private var font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
	private var fontFamily: String = ""

  public init() {
		fontFamily = font.fontName
	}

	@discardableResult
	public func fontName(_ name: String) -> FontBuilder {
		if let font = UIFont(name: name, size: ptSize) {
			self.font = font
			self.fontFamily = name
		}
    return self
	}

	@discardableResult
	public func fontSize(_ size: CGFloat) -> FontBuilder {
		if let font = UIFont(name: fontFamily, size: size) {
			self.font = font
		}
		return self
	}

	public func build() -> UIFont {
		return font
	}
}
