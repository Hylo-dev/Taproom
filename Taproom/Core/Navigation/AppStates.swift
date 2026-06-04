//
//  AppStates.swift
//  Taproom
//
//  Created by C4V4H.exe on 21/05/2026.
//

enum AppStates: String, Identifiable, CaseIterable, Hashable {
	case discover
	case settings
	case downloads
	
	var id: String { self.rawValue }
		
	var title: String {
		switch self {
		case .discover : "Discover"
		case .settings : "Settings"
		case .downloads: "Downloads"
		}
	}
	
	var systemImage: String {
		switch self {
		case .discover:  "star"
		case .settings:  "gear"
		case .downloads: "arrow.down.circle"
		}
	}
}
