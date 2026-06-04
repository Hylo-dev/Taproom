//
//  HomeView.swift
//  PuzzoList
//
//  Created by C4V4H.exe on 14/05/2026.
//

import SwiftUI

struct DownloadsView: View {
	
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



// MARK: TODO IMPLEMENT INSTALLED APP ICON LOGIG:
// cask+download -> icona del .app
// resto -> url favicon
// se url == github o non trovato -> placeholder

// import AppKit
//import SwiftUI // Se stai usando SwiftUI per l'interfaccia
//
//func getInstalledAppIcon(appName: String) -> NSImage? {
//	let fileManager = FileManager.default
//	
//	// I percorsi più comuni dove i Cask installano le app
//	let possiblePaths = [
//		"/Applications/\(appName).app",
//		"/System/Applications/\(appName).app",
//		"\(fileManager.homeDirectoryForCurrentUser.path)/Applications/\(appName).app"
//	]
//	
//	for path in possiblePaths {
//		if fileManager.fileExists(atPath: path) {
//			// Estrae l'icona direttamente dal sistema operativo
//			return NSWorkspace.shared.icon(forFile: path)
//		}
//	}
//	
//	return nil // L'app non è installata o ha un nome diverso
//}

//if let nsImage = getInstalledAppIcon(appName: "Google Chrome") {
//	Image(nsImage: nsImage)
//		.resizable()
//		.frame(width: 64, height: 64)
//} else {
//	// Mostra l'icona di default o la favicon scaricata
//	Image(systemName: "cube.box")
//}
