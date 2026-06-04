//
//  BrewFormulaDTO.swift
//  Taproom
//
//  Created by C4V4H.exe on 29/05/2026.
//

import Foundation

struct BrewFormulaDTO: Decodable {
    let name      : String
    let fullName  : String
    let tap       : String
    let oldNames  : [String]
    let aliases   : [String]
    let desc      : String?
    let homepage  : String?
    let versions  : Versions?
    let deprecated: Bool
    let disabled  : Bool

    struct Versions: Decodable {
        let stable: String?
        let head  : String?
        let bottle: Bool?
    }

    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case tap
        case oldNames = "oldnames"
        case aliases
        case desc
        case homepage
        case versions
        case deprecated
        case disabled
    }
}

extension BrewPackage {
	convenience init(formula dto: BrewFormulaDTO) {
		self.init(
			token      : dto.name,
			fullToken  : dto.fullName,
			kind       : .formula,
			displayName: dto.name,
			searchName : dto.name.lowercased(),
			descText   : dto.desc ?? "",
			homepage   : dto.homepage,
			version    : dto.versions?.stable,
			tap        : dto.tap,
			aliases    : dto.aliases,
			oldTokens  : dto.oldNames,
			deprecated : dto.deprecated,
			disabled   : dto.disabled
		)
	}
}
