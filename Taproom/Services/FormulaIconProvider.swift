//
//  FormulaIconProvider.swift
//  Taproom
//
//  Created by C4V4H.exe on 01/06/2026.
//

import Foundation
import AppKit

@MainActor
final class FormulaIconProvider {
    static let shared = FormulaIconProvider()

    private let cache = NSCache<NSString, NSImage>()

    private init() {
		// TODO: Check if there are to much chache miss or if its too big
        cache.countLimit = 500
    }

    func icon(for formula: Formula) async -> NSImage? {
        let key = formula.iconCacheKey as NSString

        if let cached = cache.object(forKey: key) {
            return cached
        }

        // 1. App installata: prendi icona dal .app locale
        if formula.isInstalled,
           let appURL = resolveInstalledAppURL(for: formula) {

            let icon = NSWorkspace.shared.icon(forFile: appURL.path)
            icon.size = NSSize(width: 128, height: 128)

            cache.setObject(icon, forKey: key)
            return icon
        }

        // 2. App non installata: prova URL favicon
		if !formula.homepage.contains("github.com"),
		   let imageURL = URL(string: formula.homepage),
		   let remoteIcon = await loadRemoteImage(from: imageURL) {

            cache.setObject(remoteIcon, forKey: key)
            return remoteIcon
        }

        // 3. Nessuna icona disponibile
        return nil
    }

    private func resolveInstalledAppURL(for formula: Formula) -> URL? {
		if let path = formula.appPath,
		   FileManager.default.fileExists(atPath: path) {
            return URL(fileURLWithPath: path)
        }

        return nil
    }

    private func loadRemoteImage(from url: URL) async -> NSImage? {
        do {
            var request = URLRequest(url: url)
            request.timeoutInterval = 10
            request.cachePolicy = .returnCacheDataElseLoad

            let (data, response) = try await URLSession.shared.data(for: request)

            guard
                let httpResponse = response as? HTTPURLResponse,
                (200..<300).contains(httpResponse.statusCode),
                let image = NSImage(data: data)
            else {
                return nil
            }

            image.size = NSSize(width: 128, height: 128)
            return image
        } catch {
            return nil
        }
    }
}
