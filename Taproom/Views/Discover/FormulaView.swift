//
//  FormulaView.swift
//  Taproom
//
//  Created by C4V4H.exe on 27/05/2026.
//

import SwiftUI

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
			
			// another divider
			
			// here the downloads?
			
			Spacer()
		}
	}
}
