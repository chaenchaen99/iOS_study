//
//  SwiftUIView.swift
//  FastSwiftBasic
//  변수타입
//  Created by 정채연 on 12/30/23.
//

import SwiftUI

struct VarType: View {
    
    var name: String = "Chaeyeon"
    var age: Int = 20
    var height: Float = 160.9
    var havePet: Bool = false
    
    
    var body: some View {
        VStack{
            Text(name)
            Text("\(age)")
            Text("\(height)")
            Text("\(havePet.description)") // havePet에 대한 description
        }
    }
}

#Preview {
    VarType()
}
