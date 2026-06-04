//
//  FormulaState.swift
//  Taproom
//
//  Created by C4V4H.exe on 28/05/2026.
//

import Foundation

/// Dati disponibili in cache/offline
struct Formula: Identifiable, Codable, Equatable, Hashable {
	let analytics: FormulaAnalytics?

	var id       : String { name }
	
	let name     : String
	let desc     : String?
	let homepage : String
	let artifact : String
	let version  : String
	let binSizeKB: Int?
	
	let type     : FormulaType
	let health   : FormulaHealth
	let state    : FormulaState
	
	var appPath: String? {
		if isInstalled {
			"/Applications/\(self.artifact)"
		} else {
			nil
		}
	}
	
	var iconCacheKey: String {
		if isInstalled && type == .cask {
			return "app-path:/Applications/\(self.artifact)"
		}
		
		if !homepage.contains("github.com"){
			return "url:\(homepage)"
		}

		return "fallback:\(id)"
	}
	
	var isInstalled: Bool { self.state.contains(.installed) }
	var isOutdated : Bool { self.state.contains(.outdated ) }
	var isPinned   : Bool { self.state.contains(.pinned   ) }
	var isUnlinked : Bool { self.state.contains(.unlinked ) }
	var binSizeText: String { self.binSizeKB?.kbToString() ?? "" }
	
	init() {
		self.analytics = FormulaAnalytics()
		self.name      = "kitty"
		self.desc      = "GPU-based terminal emulator"
		self.homepage  = "https://github.com/kovidgoyal/kitty"
		self.artifact  = "kitty.app"
		self.version   = "0.47.1"
		self.binSizeKB = Int.random(in: 1...(1024*1024*10))
		self.type      = .formula
		self.health    = FormulaHealth.allCases.randomElement() ?? .active
		self.state     = FormulaState.random()
	}
}
