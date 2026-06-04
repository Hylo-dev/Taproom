//
//  FormulaHealth.swift
//  Taproom
//
//  Created by C4V4H.exe on 29/05/2026.
//

import Foundation
import SwiftUI

enum FormulaHealth: String, Codable, CaseIterable {
	case active
	case deprecated
	case disabled
	case deleted
	
	var color: Color {
		return switch self {
		case .deprecated, .disabled:
			.orange
		case .deleted:
			.red
		case .active:
			.clear
		}
	}
	
	static let widestHealthTitle = "Deprecated"
}
