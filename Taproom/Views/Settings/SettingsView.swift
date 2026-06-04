//
//  HomeView.swift
//  PuzzoList
//
//  Created by C4V4H.exe on 14/05/2026.
//

import SwiftUI

/// la richerca e' diversa dalle altre due.
struct SettingsView: View {
	
	@Binding
	var searchText: String
	@Binding
	var showSearch: Bool
	
	var body: some View {
		VStack {
			LazyVStack {
				Text(searchText)
			}
			.frame(
				maxWidth : .infinity,
				maxHeight: .infinity,
				alignment: .topLeading
			)
		}
	}
}
