//
//  Onboarding.swift
//  WarmUp
//
//  Created by 정채연 on 1/3/24.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        VStack{
            Text("what's New in Photos")
                .font(.system(size: 35))
                .bold()
                .padding()
                .padding(.top, 40)
            
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .padding(.leading, 7)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
                VStack (alignment: .leading){
                    Text("Shared Library")
                        .font(.headline)
                    Text("Combile photos and videos with the peopleCombile photos and videos with the peopleCombile photos and videos with the people")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }.padding(.trailing)
             .padding(.bottom)
             .padding(.top, 40)
                
            
            HStack {
                Image(systemName: "square.on.square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .padding(.leading, 7)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
                VStack (alignment: .leading){
                    Text("Shared Library")
                        .font(.headline)
                    Text("Combile photos and videos with the peopleCombile photos and videos with the peopleCombile photos and videos with the people")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }.padding(.trailing)
             .padding(.bottom)
            HStack {
                Image(systemName: "person.2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .padding(.leading, 7)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
                VStack (alignment: .leading){
                    Text("Shared Library")
                        .font(.headline)
                    Text("Combile photos and videos with the peopleCombile photos and videos with the peopleCombile photos and videos with the people")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }.padding(.trailing)
            
            Spacer()
            
            Button{
                
            } label: {
                Text("Continue")
                    .padding()
                    .frame(width: 350)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }.padding(.bottom, 60)
        }
    }
}

#Preview {
    Onboarding()
}
