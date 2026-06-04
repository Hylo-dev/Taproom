//
//  FormulaIcon.swift
//  Taproom
//
//  Created by C4V4H.exe on 01/06/2026.
//

import SwiftUI

struct FormulaIconView: View {
	let formula: Formula
	let size: CGFloat
	
	@State private var nsImage: NSImage?
	
	init(formula: Formula, size: CGFloat = 32) {
		self.formula = formula
		self.size = size
	}
	
	var body: some View {
		Group {
			if let nsImage {
				Image(nsImage: nsImage)
					.resizable()
					.scaledToFit()
			} else {
				Image(systemName: "questionmark.app")
					.resizable()
					.scaledToFit()
					.foregroundStyle(.secondary)
			}
		}
		.frame(width: size, height: size)
		.task(id: formula.iconCacheKey) {
			nsImage = await FormulaIconProvider.shared.icon(for: formula)
		}
	}
}
