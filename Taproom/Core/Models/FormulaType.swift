//
//  FormulaType.swift
//  Taproom
//
//  Created by C4V4H.exe on 29/05/2026.
//

import Foundation

enum FormulaType: String, Codable, CaseIterable {
	case formula
	case cask
	
	func toId(_ name: String) -> String {
		"\(self):\(name)"
	}
}
