//
//  MyGeneric.swift
//  FastSwiftBasic
//
//  Created by 정채연 on 1/2/24.
//

import SwiftUI

struct MyGeneric: View {
    
    @State var input = ""
    @State var myStack = MyStack<Int>() //Int 부분에 필요한 타입별로 Float, String 등을 넣을 수 있다.
    //@State var myFloatStack = MyFloatStack()
    
    var body: some View {
        VStack{
            TextField("숫자를 입력해주세요", text: $input)
            Button {
                myStack.insertValue(input: Int(input) ?? 0)
            } label: {
                Text("저장")
            }
            Button {
                myStack.showData()
            } label: {
                Text("출력")
            }
        }
    }
}

struct MyStack<T> { //타입을 타지 않는 범용 코드를 만들 때 사용한다.
    var data: [T] = []
    
    mutating func insertValue(input: T) {
        data.append(input)
    }
    
    func showData()
    {
        data.forEach { item in
            print(item)
        }
    }
}

//struct MyFloatStack {
//    var data: [Float] = []
//    
//    mutating func insertValue(input: Float) {
//        data.append(input)
//    }
//    
//    func showData()
//    {
//        data.forEach { item in
//            print(item)
//        }
//    }
//}

#Preview {
    MyGeneric()
}
