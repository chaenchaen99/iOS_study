//
//  Detail.swift
//  WarmUp
//
//  Created by 정채연 on 1/7/24.
//

import SwiftUI

struct Detail: View {
    
    @Binding var isPresented: Bool //@Binding을 통해 Modal 화면으로부터 값을 받을 수 있다.
    
    var body: some View {
        VStack{
            Text("모달 페이지 입니다")
            Button{
                isPresented = false
            } label: {
              Text("화면 닫기")
            }
        }
    }
}

#Preview {
    Detail(isPresented: .constant(true))
}
