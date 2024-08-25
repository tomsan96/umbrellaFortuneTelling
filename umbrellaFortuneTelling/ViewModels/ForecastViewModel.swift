//
//  ForecastViewModel.swift
//  umbrellaFortuneTelling
//
//

import Foundation

class ForecastViewModel {
    private let client: ForecastApiClientProtocol
    
    init(client: ForecastApiClientProtocol = ForecastApiClient()) {
        self.client = client
    }
    func getChanceOfRains() async -> Int? {
        do {
            let forecasts = try await client.fetchRepository()
            return Int(forecasts.forecasts.first?.chanceOfRain.t18To24.components(separatedBy: "%")[0] ?? "")
        } catch {
            print(error)
        }
        return nil
    }
}
