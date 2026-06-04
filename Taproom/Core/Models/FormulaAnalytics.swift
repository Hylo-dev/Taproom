//
//  FormulaAnalytics.swift
//  Taproom
//
//  Created by C4V4H.exe on 29/05/2026.
//

import Foundation

/// Dati scaricati su richiesta (Online)
struct FormulaAnalytics: Codable, Equatable, Hashable {
	let downloads30d : Int
	let downloads90d : Int
	let downloads365d: Int
	
	init() {
		self.downloads30d  = 3293
		self.downloads90d  = 13604
		self.downloads365d = 58026
	}
}
