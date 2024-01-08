//
//  TabDetail.swift
//  WarmUp
//
//  Created by 정채연 on 1/8/24.
//

import SwiftUI

struct TabDetail: View {
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea() //Safe Area를 무시하고 전체화면을 차지하도록 만든다.
            Text("Thisisdetail")
        }
    }
}

struct TabDetail2: View {
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            VStack{
                Text("Thisisdetail2")
                Button{
                    
                }label: {
                    Text("Continue")
                        .padding()
                        .background(.green)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct TabDetail3: View {
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            Text("Thisisdetail3")
        }
    }
}

#Preview {
    TabDetail()
}
