//
//  MyTab.swift
//  WarmUp
//
//  Created by 정채연 on 1/8/24.
//

import SwiftUI


struct MyTab: View {
    var body: some View {
        TabView {
            TabDetail()
                .badge(2)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            TabDetail2()
                .badge(2)
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            TabDetail3()
                .badge(2)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    MyTab()
}
