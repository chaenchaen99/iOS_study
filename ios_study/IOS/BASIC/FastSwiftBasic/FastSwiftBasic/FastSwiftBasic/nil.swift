//
//  Nil.swift
//  FastSwiftBasic
//
//  Created by 정채연 on 1/1/24.
//

import SwiftUI

struct Nil: View {
    
    var name: String = "Chaen"
    var petName: String? = "coco" // 있을 수도 있고, 없을 수 도 있는데 있고, 그 값은 coco 야
    
    var bami: String = "Bami"
    var petName2: String = "coco" //   반드시 있어야만 하는 값이고, 그 값은 coco야
    
    var body: some View {
        VStack{
            //Text("이름은 \(name) 펫 네임은 \(petName) 입니다.")
            Text("이름은 \(bami) 펫 네임은 \(petName2) 입니다.")
        }.onAppear{
            print("이름은 \(bami) 펫 네임은 \(petName2) 입니다.")
            print("이름은 \(name) 펫 네임은 \(petName) 입니다.")
        }
    }
}

#Preview {
    Nil()
}
