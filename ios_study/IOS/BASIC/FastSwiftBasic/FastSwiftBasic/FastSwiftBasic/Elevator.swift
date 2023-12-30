//
//  Elevator.swift
//  FastSwiftBasic
//
//  Created by 정채연 on 12/30/23.
//

import SwiftUI

struct Elevator: View {
    
    @State var myElevator = ElevatorStruct()
    
    var body: some View {
        VStack{
            
            Text("층수: \(myElevator.level)")
            HStack{
                Button{
                    myElevator.goDown()
                } label: {
                    Text("아래로")
                }
                
                Button{
                    myElevator.goUp()
                } label: {
                    Text("위로")
                }
                
            }
        }
    }
}

struct ElevatorStruct{
    var level: Int = 1
    
    mutating func goDown() {
        level = level - 1
    }
    mutating func goUp() {
        level = level + 1
    }
}
#Preview {
    Elevator()
}
