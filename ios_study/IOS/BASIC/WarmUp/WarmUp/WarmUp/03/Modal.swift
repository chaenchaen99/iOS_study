//
//  Modal.swift
//  WarmUp
//
//  Created by 정채연 on 1/7/24.
//

import SwiftUI

struct Modal: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        VStack{
            Text("메인 페이지 입니다!")
            Button{
                showModal = true
            }label: {
                Text("모달 화면 전환")
            }
        }.sheet(isPresented: $showModal, content: {
            Detail(isPresented:  $showModal)
        })
    }
}

#Preview {
    Modal()
}
