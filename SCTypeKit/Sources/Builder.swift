//
// Created by Scott Moon on 27/08/2019.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import Foundation

public protocol Builder {
	associatedtype BuildType

	func build() -> BuildType
}
