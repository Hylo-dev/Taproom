//
//  FormulaState.swift
//  Taproom
//
//  Created by C4V4H.exe on 29/05/2026.
//

import Foundation

/// Es: `let mioStato: FormulaState = [.installed, .outdated, .pinned]`
struct FormulaState: OptionSet, Codable, Hashable {
	let rawValue: UInt8
	
	static let installed = FormulaState(rawValue: 1 << 0)
	static let outdated  = FormulaState(rawValue: 1 << 1)
	static let pinned    = FormulaState(rawValue: 1 << 2)
	static let unlinked  = FormulaState(rawValue: 1 << 3)
}

extension FormulaState {
	static func random() -> FormulaState {
		var state: FormulaState = []
		
		guard Bool.random() else {
			return []
		}
		
		state.insert(.installed)
		
		if Bool.random() {
			state.insert(.outdated)
		}
		
		if Bool.random() {
			state.insert(.pinned)
		}
		
		if Bool.random() {
			state.insert(.unlinked)
		}
		
		return state
	}
}
