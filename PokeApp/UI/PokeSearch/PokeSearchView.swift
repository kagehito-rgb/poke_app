//
//  PokeSearchView.swift
//  PokeApp
//
//  Created by 中村裕紀 on 2020/11/16.
//

import SwiftUI

struct PokeSearchView: View {

    @StateObject var viewModel: PokeSearchViewModel
    @State var numberString: String = ""

    var body: some View {
        VStack {
            Text("Pokemon").font(.largeTitle).bold()

            HStack {
                TextField("検索するポケモンの図鑑番号", text: $numberString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius:4).stroke(Color.black, lineWidth: 1))
                Button(action: {
                    viewModel.seacrh(id: Int(numberString) ?? 0)
                }, label: {
                    Text("検索")
                        .foregroundColor(Color.black)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 6)
                }).overlay(RoundedRectangle(cornerRadius:4).stroke(Color.black, lineWidth: 1))
            }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .top, spacing: 20) {
                    Text("No.")
                    Text(String(viewModel.entity.id))
                }
                HStack {
                    Text("name:")
                    Text(viewModel.entity.name)
                }
            }

            if let imageData = viewModel.loadData {
                Image(uiImage: UIImage(data: imageData)!)
                    .frame(width: 300, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            } else {
                Image(uiImage: UIImage(systemName: "iphone.homebutton.slash")!)
                    .frame(width: 300, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }

            Spacer()
        }
    }
}

struct PokeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PokeSearchView(
            viewModel: PokeSearchViewModel()
        )
    }
}
