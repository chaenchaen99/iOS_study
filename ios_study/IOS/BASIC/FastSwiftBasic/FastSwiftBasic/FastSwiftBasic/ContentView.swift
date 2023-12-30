//
//  ContentView.swift
//  FastSwiftBasic
//
//  Created by 정채연 on 12/30/23.
//

import SwiftUI

struct ContentView: View {
    
    var name: String = "Chaeyeon" 
    //변수: 데이터를 담아두는 공간
    //이 공간을 잘 사용해야 개발이 편하다
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(name)님 안녕하세요")
            Text("\(name)님의 포인트는 343점 입니다")
            Text("\(name)님 안녕히가세요~!")
            Text(name)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
