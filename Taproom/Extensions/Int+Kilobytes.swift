//
//  Int+Kilobytes.swift
//  Taproom
//
//  Created by C4V4H.exe on 03/06/2026.
//

import Foundation

extension Int {
	func kbToString() -> String {
		if self < 1024 {
			return "\(self) KB"
		}
		
		let mb = Double(self) / 1024
		if mb < 1024 {
			return String(format: "%.1f MB", mb)
		}
		
		let gb = mb / 1024
		return String(format: "%.2f GB", gb)
	}
}
