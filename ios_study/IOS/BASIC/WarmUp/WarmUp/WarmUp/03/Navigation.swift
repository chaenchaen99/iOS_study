//
//  Navigation.swift
//  WarmUp
//
//  Created by 정채연 on 1/7/24.
//

import SwiftUI

struct DetailView: Hashable {
    let title: String
    let description: String
}

struct Navigation: View {
    @State var showModal: Bool = false
    @State var detailViews: [DetailView] = [
        DetailView(title: "디테일 뷰로 이동하기", description: "데스티네이션 입니다."),
        DetailView(title: "디테일 뷰로 이동하기2", description: "데스티네이션 입니다.2")
    ]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach([0,1], id: \.self){index in
                    NavigationLink {
                        Text(detailViews[index].description)
                    } label: {
                        Text(detailViews[index].title)
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        showModal = true
                    } label: {
                        Text("Add")
                    }
                }
            }
            .sheet(isPresented: $showModal, content: {
                Text("아이템 추가 페이지 입니다.")
            })
            .navigationTitle("네비게이션")
        }
    }
}

#Preview {
    Navigation()
}
