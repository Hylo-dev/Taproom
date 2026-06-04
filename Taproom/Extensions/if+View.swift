//
//  if+View.swift
//  Taproom
//
//  Created by C4V4H.exe on 03/06/2026.
//
import SwiftUI

extension View {
	@ViewBuilder
	func `if`<Content: View>(
		_ condition: Bool,
		transform: (Self) -> Content
	) -> some View {
		if condition {
			transform(self)
		} else {
			self
		}
	}
	
	@ViewBuilder
	func `if`<TrueContent: View, FalseContent: View>(
		_ condition: Bool,
		transform: (Self) -> TrueContent,
		else elseTransform: (Self) -> FalseContent
	) -> some View {
		if condition {
			transform(self)
		} else {
			elseTransform(self)
		}
	}
}
