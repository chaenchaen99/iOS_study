//
//  Selection.swift
//  FastSwiftBasic
//
//  Created by 정채연 on 12/31/23.
//

import SwiftUI

struct Selection: View {
    
    @State var myDirection: Direction = .south
    var body: some View {
        switch myDirection {
        case .north:
            Text("북쪽은 추워요")
        case .west:
            Text("서쪽은 석양이 예뻐요")
        case .south:
            Text("남쪽은 따듯해요")
        case .east:
            Text("동쪽으로 해보러 갈래요?")
        default:
            Text("에러입니다.")
        }
        
        Button {
            switch myDirection {
            case .north:
                myDirection = .east
            case .west:
                myDirection = .north
            case .east:
                myDirection = .south
            case .south:
                myDirection = .west
            default:
                myDirection = .north
            }
        } label: {
            Text("돌려돌려")
        }
    }
}

enum Direction: String {
    case north = "북"
    case west = "서"
    case east = "동"
    case south = "남"
}

#Preview {
    Selection()
}
