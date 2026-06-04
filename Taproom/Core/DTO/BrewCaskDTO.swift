//
//  BrewCaskDTO.swift
//  Taproom
//
//  Created by C4V4H.exe on 29/05/2026.
//

import Foundation

struct BrewCaskDTO: Decodable {
    let token      : String
    let fullToken  : String
    let oldTokens  : [String]
    let tap        : String
    let name       : [String]
    let desc       : String?
    let homepage   : String?
    let version    : String?
    let deprecated : Bool
    let disabled   : Bool
    let autoUpdates: Bool?

    enum CodingKeys: String, CodingKey {
        case token
        case fullToken = "full_token"
        case oldTokens = "old_tokens"
        case tap
        case name
        case desc
        case homepage
        case version
        case deprecated
        case disabled
        case autoUpdates = "auto_updates"
    }
}

extension BrewPackage {
	convenience init(cask dto: BrewCaskDTO) {
		let displayName = dto.name.first ?? dto.token
		
		self.init(
			token      : dto.token,
			fullToken  : dto.fullToken,
			kind       : .cask,
			displayName: displayName,
			searchName : displayName.lowercased(),
			descText   : dto.desc ?? "",
			homepage   : dto.homepage,
			version    : dto.version,
			tap        : dto.tap,
			aliases    : dto.name.dropFirst().map { $0 },
			oldTokens  : dto.oldTokens,
			deprecated : dto.deprecated,
			disabled   : dto.disabled
		)
	}
}
