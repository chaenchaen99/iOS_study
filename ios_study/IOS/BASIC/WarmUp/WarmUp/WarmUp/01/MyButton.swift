//
//  MyButton.swift
//  WarmUp
//
//  Created by 정채연 on 1/3/24.
//

import SwiftUI

struct MyButton: View {
    
    var buttonTitle: String
    var buttonColor: Color
    
    var body: some View {
        Button{
            
        } label: {
            Text("Button 1")
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(10)
        }
    }
}

#Preview {
    MyButton(buttonTitle: "Button4", buttonColor: .brown)
}
