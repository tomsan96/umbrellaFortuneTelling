//
//  Forecast.swift
//  umbrellaFortuneTelling
//
//

import Foundation

struct Forecast: Codable {
    let date: String
    let dateLabel: String
    let telop: String
    let detail: Detail
    let chanceOfRain: ChanceOfRain
}
