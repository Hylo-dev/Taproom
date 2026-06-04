//
//  FormulaRow.swift
//  Taproom
//
//  Created by C4V4H.exe on 27/05/2026.
//

import SwiftUI

enum ButtonAction: String, CaseIterable {
	case install
	case update
	case delete
	
	var title: String {
		rawValue.capitalized
	}
}

/// component containing the formula info. so icon title {cask, normal} MB and version(?)
/// "questionmark.app" for github and not found
struct FormulaRow: View, Equatable {
	
	// ==================== Static let ================== //
	static private let maxSizeCharacterCount = "888,88 MB"
	
	static private let widestActionTitle     = "UPDATE"
	
	// ===================== Params ===================== //
	var formula: Formula
	
	// ================== Private vars ================== //
	private var action: ButtonAction
	
	// ===================== States ===================== //
	@State
	private var versionText = AttributedString("")
	
	@State
	private var isHovered   = false
	
	
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
		HStack(alignment: .center) {
			
			// ================ Leading parts ================ //
			
			FormulaIconView(formula: formula)
			
			// ============ Title and Description ============ //
			VStack(alignment: .leading) {
				HStack {
					Text(formula.name.capitalized)
						.font(.headline)
						.lineLimit(1)
					
					Text(versionText)
						.font(.caption)
						.foregroundStyle(.tertiary)
						.lineLimit(1)
				}
				HStack{
					Text(formula.desc ?? "")
						.font(.subheadline)
						.foregroundStyle(.secondary)
						.lineLimit(1)
				}
			}

			Spacer()
			
			// ================ Trailing part ================ //

			if formula.isInstalled {
				// MARK: Formula Health
				if formula.health != .active {
					ReservedWidthView(alignment: .trailing) {
						Text(FormulaHealth.widestHealthTitle)
							.fontWeight(.semibold)
							.padding(6)
					} content: {
						Text(formula.health.rawValue.capitalized)
							.fontWeight(.semibold)
							.foregroundStyle(formula.health.color)
							.padding(6)
							.background(
								RoundedRectangle(cornerRadius: 7)
									.fill(formula.health.color.opacity(0.18))
							)
					}
				}
				
				// MARK: Binary Size
				ReservedWidthView(alignment: .trailing) {
					Text(Self.maxSizeCharacterCount)
						.font(.footnote.monospaced())
				} content: {
					Text(formula.binSizeText)
						.font(.footnote.monospaced())
						.foregroundStyle(.secondary)
				}
			}
			
			// MARK: Action button
			Button {
				debugPrint(action.rawValue)
			} label: {
				ReservedWidthView {
					Text(Self.widestActionTitle)
						.fontWeight(.semibold)
				} content: {
					Text(action.title)
						.fontWeight(.semibold)
						.foregroundStyle(Color.accentColor)
				}
			}
			.buttonBorderShape(.capsule)
			
		}
		.onHover(perform: { val in
			isHovered = val
		})
		.padding(7)
		.background(
			RoundedRectangle(cornerRadius: 10)
				.fill(
					isHovered ? Color.primary.opacity(0.18) : Color.clear
				)
		)
		.frame(maxWidth: .infinity)
		.onAppear {
			self.versionText = getVersionText()
		}
		.swipeActions(edge: .trailing, allowsFullSwipe: true) {
			Button {
				debugPrint("toggle pin")
			} label: {
				Label("Pin", systemImage: "pin")
			}
			.tint(.gray)
		}
	}
	
	@inline(__always)
	func getVersionText() -> AttributedString {
		var result = AttributedString()
		
		func append(_ string: String, color: Color) {
			var part = AttributedString(string)
			part.foregroundColor = color
			result += part
		}
		
		append("(", color: .secondary)
		
		if action == .update {
			append("\(formula.version)", color: .yellow)
			append(" → ", color: .secondary)
			append("\(formula.version)", color: .green)
			append(")", color: .secondary)
		} else {
			append("\(formula.version))", color: .secondary)
		}
		
		return result
	}
	
	static func == (lhs: FormulaRow, rhs: FormulaRow) -> Bool {
		lhs.formula == rhs.formula
	}
}


#Preview {
	VStack {
		ForEach(0..<10, id: \.self) { index in
			FormulaRow(formula: Formula())
		}
	}
}
