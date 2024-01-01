//
//  Exception.swift
//  FastSwiftBasic
//
//  Created by 정채연 on 1/1/24.
//

import SwiftUI

struct Exception: View {
    
    @State var inputNumber = ""
    @State var resultNumber: Float = 0
    
    
    var body: some View {
        VStack{
            TextField("나눌 숫자를 입력하세요", text: $inputNumber)
            Text("나눈 결과는 다음과 같아요 \(resultNumber)")
            Button {
                
                do {
                    try resultNumber = devideTen(with: (Float(inputNumber) ?? 1.0))
                } 
                catch DivideError.dividedByZoro {
                    print("0으로 나누었대요")
                    resultNumber = 0
                }
                catch {
                    print(error.localizedDescription)
                }
            } label: {
                Text("나누기")
            }
        }
    }
    
    func devideTen(with inputNumber: Float) throws -> Float {
        var result: Float = 0
        if inputNumber == 0 {
            throw DivideError.dividedByZoro
        }
        else {
            result = 10 / inputNumber
        }
        return result
    }
}

enum DivideError: Error {
    case dividedByZoro
}

#Preview {
    Exception()
}
