//
//  BrewPackageKind.swift
//  Taproom
//
//  Created by C4V4H.exe on 29/05/2026.
//

import Foundation
import SwiftData

@Model
final class BrewPackage {
    @Attribute(.unique)
    var id         : UUID

    var token      : String
    var fullToken  : String
    var kindRaw    : String

    var displayName: String
    var searchName : String
    var descText   : String
    var homepage   : String?
    var version    : String?

    var tap        : String
    var aliases    : [String]
    var oldTokens  : [String]

    var deprecated : Bool
    var disabled   : Bool

    var updatedAt  : Date

    var kind       : FormulaType {
        get {
            FormulaType(rawValue: kindRaw) ?? .formula
        }
        set {
            kindRaw = newValue.rawValue
        }
    }

    init(
        token      : String,
        fullToken  : String,
        kind       : FormulaType,
        displayName: String,
        searchName : String,
        descText   : String,
        homepage   : String?,
        version    : String?,
        tap        : String,
        aliases    : [String],
        oldTokens  : [String],
        deprecated : Bool,
        disabled   : Bool,
        updatedAt  : Date = .now
    ) {
        self.id          = UUID()
        self.token       = token
        self.fullToken   = fullToken
        self.kindRaw     = kind.rawValue
        self.displayName = displayName
        self.searchName  = searchName
        self.descText    = descText
        self.homepage    = homepage
        self.version     = version
        self.tap         = tap
        self.aliases     = aliases
        self.oldTokens   = oldTokens
        self.deprecated  = deprecated
        self.disabled    = disabled
        self.updatedAt   = updatedAt
    }
}
