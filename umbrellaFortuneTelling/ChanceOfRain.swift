//
//  ChanceOfRain.swift
//  umbrellaFortuneTelling
//
//

import Foundation

struct ChanceOfRain: Codable {
    let t00To06: String
    let t06To12: String
    let t12To18: String
    let t18To24: String
    
    enum CodingKeys: String, CodingKey {
        case t00To06 = "T00_06"
        case t06To12 = "T06_12"
        case t12To18 = "T12_18"
        case t18To24 = "T18_24"
    }
}
