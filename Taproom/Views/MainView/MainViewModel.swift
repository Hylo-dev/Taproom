//
//  CatalogViewModel.swift
//  Taproom
//
//  Created by C4V4H.exe on 29/05/2026.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class CatalogViewModel: ObservableObject {
	@Published var packages    : [BrewPackage] = []
	@Published var searchText  : String        = ""
	@Published var isLoading   : Bool          = false
	@Published var errorMessage: String?
	
//	private let syncService: BrewCatalogSyncService
	
//	init(syncService: BrewCatalogSyncService) {
//		self.syncService = syncService
//	}
//	
	func onAppear() {
		Task {
			await load()
		}
	}
	
	private func load() async {
		isLoading = true
		
//		do {
//			try await syncService.syncIfNeeded()
//			packages = try await syncService.loadPackages()
//			
//			bannerMessage = nil
//			errorMessage = nil
//		} catch {
//			errorMessage = error.localizedDescription
//			bannerMessage = nil
//		}
		
		isLoading = false
	}
}
