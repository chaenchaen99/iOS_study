//
//  Layout.swift
//  WarmUp
//
//  Created by 정채연 on 1/3/24.
//

import SwiftUI

struct Layout: View {
    var body: some View {
        VStack{
            Image(systemName: "pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
            
            Text("Text Element 1")
                .font(.headline)
                .padding()
            Text("Text Element 2")
                .font(.subheadline)
                .padding()
            Text("Text Element 3")
                .font(.caption)
                .padding()
            
            HStack{
                MyButton(buttonTitle: "Button1", buttonColor: .blue)
                MyButton(buttonTitle: "Button2", buttonColor: .cyan)
            }
            Button {
                
            } label: {
                VStack{
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    Text("Complex Button")
                }
                .foregroundColor(.white)
                .padding()
                .background(.orange)
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    Layout()
}
