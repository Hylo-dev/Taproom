//
//  ReservedWidthView.swift
//  Taproom
//
//  Created by C4V4H.exe on 04/06/2026.
//

import SwiftUI

struct ReservedWidthView<Placeholder: View, Content: View>: View {
	let alignment: Alignment
	let placeholder: Placeholder
	let content: Content
	
	init(
		alignment: Alignment = .center,
		@ViewBuilder placeholder: () -> Placeholder,
		@ViewBuilder content: () -> Content
	) {
		self.alignment = alignment
		self.placeholder = placeholder()
		self.content = content()
	}
	
	var body: some View {
		ZStack(alignment: alignment) {
			placeholder
				.hidden()
			
			content
		}
	}
}
