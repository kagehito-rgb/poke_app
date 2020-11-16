//
//  PokeSearchEntity.swift
//  PokeApp
//
//  Created by 中村裕紀 on 2020/11/16.
//

import Foundation

class PokeSearchEntity: ObservableObject {

    @Published var id: Int
    @Published var name: String
    @Published var frontDefault: String

    init(
        id: Int,
        name: String,
        frontDefault: String
    ) {
        self.id = id
        self.name = name
        self.frontDefault = frontDefault
    }
}
