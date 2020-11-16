//
//  ContentView.swift
//  PokeApp
//
//  Created by 中村裕紀 on 2020/11/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PokeSearchView(
            viewModel: PokeSearchViewModel()
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
