//
//  HomeView.swift
//  PuzzoList
//
//  Created by C4V4H.exe on 14/05/2026.
//

import SwiftUI

struct DiscoverView: View {
	
	@Binding
	var searchText: String
	@Binding
	var showSearch: Bool

	@State
	private var navigationPath: [Formula] = []
	
	var body: some View {
		NavigationStack(path: $navigationPath) {
			List {
				ForEach(0..<20, id: \.self) { index in
					let formula = Formula()
					FormulaRow(formula: formula)
						.contentShape(.rect)
						.onTapGesture {
							navigationPath.append(formula)
						}
				}
			}
			.padding(.horizontal, 7)
			.scrollContentBackground(.hidden)
			.background(.clear)
			.listStyle(.sidebar)
			.frame(
				maxWidth : .infinity,
				maxHeight: .infinity,
				alignment: .topLeading
			)
			.navigationDestination(for: Formula.self) { formula in
				FormulaView(formula: formula)
					.navigationTitle(formula.name)
			}
		}
	}
}
