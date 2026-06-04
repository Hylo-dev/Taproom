//
//  BrewCatalogSyncService.swift
//  Taproom
//
//  Created by C4V4H.exe on 29/05/2026.
//

import Foundation
import SwiftData

actor BrewCatalogSyncService {
	private let container: ModelContainer
	private let refreshInterval: TimeInterval = 24 * 60 * 60
	
	init(container: ModelContainer) {
		self.container = container
	}
//	
//	func syncIfNeeded() async throws -> CatalogSyncResult {
//		let context = ModelContext(container)
//		
//		let packageCount = try context.fetchCount(FetchDescriptor<BrewPackage>())
//		let metadata = try getOrCreateMetadata(context: context)
//		
//		if packageCount == 0 || metadata.isInitialLoadCompleted == false {
//			try await refreshCatalog(context: context)
//			return .initialLoadStarted
//		}
//		
//		if let nextSyncAfter = metadata.nextSyncAfter,
//		   Date() < nextSyncAfter {
//			return .skipped
//		}
//		
//		try await refreshCatalog(context: context)
//		return .refreshStarted
//	}
//	
//	func forceRefresh() async throws {
//		let context = ModelContext(container)
//		try await refreshCatalog(context: context)
//	}
//	
//	func loadPackages() async throws -> [BrewPackage] {
//		let context = ModelContext(container)
//		
//		let descriptor = FetchDescriptor<BrewPackage>(
//			sortBy: [
//				SortDescriptor(\.displayName)
//			]
//		)
//		
//		return try context.fetch(descriptor)
//	}
//	
//	private func getOrCreateMetadata(context: ModelContext) throws -> BrewCatalogMetadata {
//		let descriptor = FetchDescriptor<BrewCatalogMetadata>(
//			predicate: #Predicate { $0.id == "brew-catalog" }
//		)
//		
//		if let metadata = try context.fetch(descriptor).first {
//			return metadata
//		}
//		
//		let metadata = BrewCatalogMetadata()
//		context.insert(metadata)
//		try context.save()
//		
//		return metadata
//	}
}
