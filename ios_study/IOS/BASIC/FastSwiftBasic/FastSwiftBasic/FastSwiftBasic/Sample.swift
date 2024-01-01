//
//  Sample.swift
//  FastSwiftBasic
//
//  Created by 정채연 on 1/1/24.
//

import SwiftUI

struct Sample: View {
    
    let data = [
        Destination(direction: .north,
                    food: "파스타맛집",
                    imageName: Image(systemName: "carrot")),
        Destination(direction: .east,
                    food: nil,
                    imageName: Image(systemName: "waterbottle")),
        Destination(direction: .south,
                    food: nil,
                    imageName: Image(systemName: "wineglass")),
        Destination(direction: .west,
                    food: "떡볶이맛집",
                    imageName: Image(systemName: "takeoutbag.and.cup.and.straw"))
    ]
    
    @State var selectedDestination: Destination?
    
    var body: some View {
        VStack{
            selectedDestination?.imageName
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            if let destination = selectedDestination {
                if let food = destination.food {
                    Text(food)
                }
                Text(destination.direction.rawValue)
            }
            
            Button{
                selectedDestination = data.randomElement()
            } label: {
                Text("돌려돌려~")
            }
        }
    }
}

struct Destination {
    let direction: DirectionSample
    let food: String?
    let imageName: Image
}

enum DirectionSample: String {
    case north = "북"
    case east = "동"
    case south = "남"
    case west = "서"
}
#Preview {
    Sample()
}
