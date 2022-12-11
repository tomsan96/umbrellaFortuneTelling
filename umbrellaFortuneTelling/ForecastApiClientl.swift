//
//  ForecastApiClient.swift
//  umbrellaFortuneTelling
//
//

import Foundation

protocol ForecastApiClientProtocol {
    func fetchRepository() async throws -> Forecasts
}

enum ApiError: Error {
    case badURL
    case badStatusCode(_ statusCode: Int?)
}

class ForecastApiClient: ForecastApiClientProtocol {
    func fetchRepository() async throws -> Forecasts {
        guard let url = URL(string: "https://weather.tsukumijima.net/api/forecast/city/130010") else { throw ApiError.badURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ApiError.badStatusCode((response as? HTTPURLResponse)?.statusCode)
        }
        return try JSONDecoder().decode(Forecasts.self, from: data)
    }
}
