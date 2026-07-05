//
//  FormulaView.swift
//  Taproom
//
//  Created by C4V4H.exe on 27/05/2026.
//

import SwiftUI
import SwiftUIKit

/// this view will contain the formula info. like description and stuffs
struct FormulaView: View {
	var formula: Formula
	
	private var action: ButtonAction
	
	init(formula: Formula) {
		self.formula = formula
		
		self.action = if formula.isOutdated {
			.update
		} else if formula.isInstalled {
			.install
		} else {
			.delete
		}
	}
	
	var body: some View {
		VStack {
			HStack {
				// img
				FormulaIconView(formula: formula, size: 120)
					.padding(.vertical, 25)
					.padding(.horizontal, 30)
				
				VStack(alignment: .leading) {
					Text(formula.name)
						.font(.title)
						.fontWeight(.bold)
					
					Text(formula.desc ?? "")
						.font(.subheadline)
						.foregroundStyle(.secondary)
					
					Spacer()
					
					Button {
						debugPrint(action.rawValue)
					} label: {
						Text(action.rawValue.capitalized)
							.font(.body)
							.fontWeight(.semibold)
					}
					.buttonStyle(.borderedProminent)
					.buttonBorderShape(.capsule)
					.tint(.accentColor)
				}
				.padding(.vertical, 10)
				
				Spacer()
			}
			.frame(maxHeight: 120)
			
			Divider()
				.padding(.vertical  , 20)
				.padding(.horizontal, 40)
			
			// here the stats?
			
//			Divider()
//				.padding(.vertical  , 20)
//				.padding(.horizontal, 40)
			
			// here the downloads?
			
			if let analytics = formula.analytics {
				HStack {
					Spacer()

					StackedText(
						"\(analytics.downloads30d)",
						desc: "30 days"
					)
					
					Spacer()
					Divider()
					Spacer()
					
					StackedText(
						"\(analytics.downloads90d)",
						desc: "90 days"
					)
					
					Spacer()
					Divider()
					Spacer()
					
					StackedText(
						"\(analytics.downloads365d)",
						desc: "365 days"
					)
					
					Spacer()
				}
				.frame(maxWidth: .infinity)
				.padding(20)
				.surface(.primary, in: .roundedRect(cornerRadius: 20))
				.padding(20)

			}
			
			Spacer()
		}
	}
}

struct StackedText: View {
	var title: String
	var desc : String
	
	init(_ title: String, desc: String) {
		self.title = title
		self.desc  = desc
	}
	
	var body: some View {
		VStack {
			Text(title)
				.font(.title)
				.fontWeight(.bold)
			Text(desc)
				.font(.caption)
				.foregroundStyle(.secondary)
		}
	}
}
