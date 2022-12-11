//
//  ContentView.swift
//  umbrellaFortuneTelling
//
//

import SwiftUI

struct ContentView: View {
    let viewModel = ForecastViewModel()
    @State private var path = [Int]()
    var body: some View {
        NavigationStack(path: $path) {
            Text("今日、傘いる？")
            Image("uranai_suisyou")
                .resizable()
                .frame(width: 200, height: 200)
            Button {
                Task {
                    let chanceOfRain = await viewModel.getChanceOfRains()
                    guard let chanceOfRain = chanceOfRain else { return }
                    path.append(chanceOfRain)
                }
                
            } label: {
                Text("占う")
            }
            .navigationDestination(for: Int.self) { value in
                FortuneTellingView(chanceOfRain: value)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
