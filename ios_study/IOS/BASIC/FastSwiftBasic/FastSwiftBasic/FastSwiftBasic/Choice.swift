//
//  Choice.swift
//  FastSwiftBasic
//
//  Created by 정채연 on 12/31/23.
//

import SwiftUI

struct Choice: View {
    
    var direction: Direction_ = .east
    var member: Member = .leeo
    var menu: Menu = .steak("미디움")
    
    var body: some View {
        Text("방향은 \(direction.rawValue)쪽 입니다.")
    }
}


//enum은 잘 사용하면 할수록 코딩이 편해진다.
//어떻게 잘 사용할 수 있는지는 지식을 많이 알고 있을 수록 활용도가 높아진다
enum Member: String {
    case leeo = "리이오"
    case chaen
    case jungi
    case dami
    case hyungin
}

enum Menu {
    case pizza
    case pasta
    case steak(String) //case에 연관된 값을 넣을 수 있다.(String)(int)
}
enum Direction_: String {
    case north = "북"
    case west = "서"
    case east = "동"
    case south = "남"
}

#Preview {
    Choice()
}
