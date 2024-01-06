//
//  ListLoop.swift
//  WarmUp
//
//  Created by 정채연 on 1/4/24.
//

import SwiftUI

struct Fruit: Hashable {
    let name: String
    let matchFruitName: String
    let price: Int
}

struct ListLoop: View {//리스트
    
   @State var favoriteFruits = [ //모델링 한 데이터
        Fruit(name: "Apple",
              matchFruitName: "Banana",
              price: 1000),
        Fruit(name: "Banana",
              matchFruitName: "Strawberry",
              price: 2000),
        Fruit(name: "Cheery",
              matchFruitName: "Double kiwi",
              price: 3000),
        Fruit(name: "Double kiwi",
              matchFruitName: "Elder berry",
              price: 2400),
        Fruit(name: "Elder berry",
              matchFruitName: "Elder berry",
              price: 8000),
        Fruit(name: "Apple",
              matchFruitName: "Banana",
              price: 1000), //Hashable: 첫번째 데이터와 같은 동명이인을 허용하겠다
    ]
    
    //모델링 하지 않은 데이터
    var fruits = ["Apple", "Banana", "Cherry", "Double kiwi", "Elder berry"]
    var matchFruits = ["Banana", "Strawberry", "Double kiwi", "Elder berry", "Elder berry"]
    var price = ["1000", "3000", "4000", "2400", "8000"]
    var count = 0
    
    @State var fruitName: String = ""
    var body: some View {
        NavigationStack {
            
            HStack {
                TextField("insert fruit name", text: $fruitName)
                Button {
                    favoriteFruits.append(Fruit(name: fruitName, matchFruitName: "Apple", price: 1000))
                } label: {
                    Text("insert")
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            List {
                ForEach(favoriteFruits, id: \.self){ fruit in
                    VStack(alignment: .leading) {
                        Text("name: \(fruit.name)")
                        Text("matchFruitName: \(fruit.matchFruitName)")
                        Text("price: \(fruit.price)")
                    }
                }.onDelete(perform: { indexSet in //Swipe 지우기
                    favoriteFruits.remove(atOffsets: indexSet)
                })
            }.navigationTitle("Fruit List")
        }
    }
}

#Preview {
    ListLoop()
}
