//
//  URLImage.swift
//  PokeApp
//
//  Created by 中村裕紀 on 2020/11/16.
//

import Foundation

protocol URLImageLoadable : ObservableObject {
    var loadData: Data? { get set }
}

extension URLImageLoadable {
    func loadImage(url: String) {

        guard let imageURL = URL(string: url) else { return }

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                self.loadData = data
            }
        }
    }
}
