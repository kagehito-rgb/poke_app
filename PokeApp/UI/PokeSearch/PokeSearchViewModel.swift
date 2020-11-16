//
//  PokeSearchViewModel.swift
//  PokeApp
//
//  Created by 中村裕紀 on 2020/11/16.
//

import Foundation
import PokemonAPI
import Combine

class PokeSearchViewModel: ObservableObject, URLImageLoadable {

    @Published var entity: PokeSearchEntity
    let objectWillChange = ObservableObjectPublisher()
    var loadData: Data? = nil {
        willSet {
            // 画像ロードによってセットされるDataを持って更新をSwiftUIに通知する
            objectWillChange.send()
        }
    }

    init() {
        // デフォルトはピカチュウで初期化
        self.entity = PokeSearchEntity(
            id: 25,
            name: "pikachu",
            frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png"
        )
        loadImage(url: self.entity.frontDefault)
    }

    func seacrh(id: Int) {
        PokemonAPI().pokemonService.fetchPokemon(id) { result in
            switch result {
            case .success(let pokemon):
                // データ取得できたらそのポケモンのデータでEntityの更新をSwiftUIに通知する
                self.entity = PokeSearchEntity(
                    id: pokemon.id ?? 0,
                    name: pokemon.name ?? "?",
                    frontDefault: pokemon.sprites?.frontDefault ?? ""
                )
                // データ取得の際にそのポケモンの画像URLをロードする
                self.loadImage(url: self.entity.frontDefault)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
