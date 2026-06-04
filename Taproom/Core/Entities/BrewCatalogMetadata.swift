//
//  BrewPackageMetadata.swift
//  Taproom
//
//  Created by C4V4H.exe on 29/05/2026.
//

import Foundation
import SwiftData

@Model
final class BrewCatalogMetadata {
	@Attribute(.unique)
	var id: UUID
	
	var lastSuccessfulSyncAt: Date?
	var nextSyncAfter: Date?
	
	var isInitialLoadCompleted: Bool
	
	var formulaETag: String?
	var caskETag: String?
	
	init(
		lastSuccessfulSyncAt: Date? = nil,
		nextSyncAfter: Date? = nil,
		isInitialLoadCompleted: Bool = false,
		formulaETag: String? = nil,
		caskETag: String? = nil
	) {
		self.id = UUID()
		self.lastSuccessfulSyncAt = lastSuccessfulSyncAt
		self.nextSyncAfter = nextSyncAfter
		self.isInitialLoadCompleted = isInitialLoadCompleted
		self.formulaETag = formulaETag
		self.caskETag = caskETag
	}
}
