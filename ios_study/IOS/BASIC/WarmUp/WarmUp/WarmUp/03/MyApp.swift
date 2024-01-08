//
//  MyApp.swift
//  WarmUp
//
//  Created by 정채연 on 1/8/24.
//

import SwiftUI

struct MyApp: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        TabView {
            FirstList()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            Text("두번째 페이지")
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            Text("세번째 페이지")
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            Text("네번째 페이지")
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
        }
        .sheet(isPresented: $showModal, content: {
            TabView{ //화면이 생성되자 마자 보여지는 화면
                OnboardingSample(onboardingTitle:  "온보딩1", backgroundColor: .blue)
                OnboardingSample(onboardingTitle:  "온보딩2", backgroundColor: .green)
                ZStack {
                    Color.orange.ignoresSafeArea()
                    VStack{
                        Text("온보딩3")
                        Button{
                            showModal = false
                        }label: {
                            Text("Start")
                        }
                    }
                }
            }.tabViewStyle(.page)
        })
        .onAppear{
            showModal = true
        }
    }
}

#Preview {
    MyApp()
}
