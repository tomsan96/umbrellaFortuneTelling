//
//  FortuneTellingView.swift
//  umbrellaFortuneTelling
//
//

import SwiftUI

struct FortuneTellingView: View {
    @State var chanceOfRain: Int
    
    var body: some View {
        if isHeigherThanRandomInt() {
            Text("傘を持って行きましょう！")
            Image("walking_rain_man")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
        } else {
            Text("傘はきっといらないでしょう！")
            Image("tenki_hare_onna")
                .resizable()
                .scaledToFit()   
                .frame(width: 300, height: 300)
        }
        Text("(今夜、東京の降水確率は\(chanceOfRain)%です)")
    }
    
    private func isHeigherThanRandomInt() -> Bool {
        let randomInt = Int.random(in: 1...100)
        return randomInt <= chanceOfRain
    }
}

struct FortuneTellingView_Previews: PreviewProvider {
    static var previews: some View {
        FortuneTellingView(chanceOfRain: 30)
    }
}
