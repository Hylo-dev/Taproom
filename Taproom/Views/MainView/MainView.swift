//
//  MainView.swift
//  Taproom
//
//  Created by C4V4H.exe on 29/05/2026.
//

import SwiftUI

struct MainView: View {
	@State
	private var appState: AppStates = .discover
	
	@State
	private var searchText: String = ""
	@State
	private var showSearch: Bool = false
	
	var body: some View {
		NavigationSplitView {
			List(AppStates.allCases, selection: $appState) { state in
				NavigationLink(value: state) {
					Label(state.title, systemImage: state.systemImage)
				}
			}
			.listStyle(.sidebar)
			.searchable(text: $searchText, prompt: "Search...")
			.onSubmit(of: .search) {
				showSearch = true
			}
			.onChange(of: searchText) { _, newValue in
				if newValue.isEmpty {
					showSearch = false
				}
			}
			.onChange(of: appState) {
				showSearch = false
				searchText = ""
			}
		} detail: {
			switch appState {
			case .discover:
				DiscoverView(
					searchText: $searchText,
					showSearch: $showSearch
				)
			case .settings:
				SettingsView(
					searchText: $searchText,
					showSearch: $showSearch
				)
			case .downloads:
				DownloadsView(
					searchText: $searchText,
					showSearch: $showSearch
				)
			}
		}
		.containerBackground(.thinMaterial, for: .window)
		.toolbarBackgroundVisibility(.hidden, for: .windowToolbar)
		.overlay(alignment: .top) {
			Rectangle()
				.fill(.ultraThinMaterial)
				.frame(height: 55)
				.mask {
					LinearGradient(
						stops: [
							.init(color: .primary, location: 0),
							.init(color: .clear, location: 1)
						],
						startPoint: .top,
						endPoint: .bottom
					)
				}
				.ignoresSafeArea(edges: .top)
				.allowsHitTesting(false)
		}
	}
}
