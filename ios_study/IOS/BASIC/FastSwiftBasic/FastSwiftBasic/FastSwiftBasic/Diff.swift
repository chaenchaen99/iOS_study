//
//  Diff.swift
//  FastSwiftBasic
//
//  Created by 정채연 on 12/30/23.
//

import SwiftUI

struct Diff: View {
    
    let myCar = Car(name: "채연카", owner: "채연")
    @ObservedObject var myKar = Kar(name: "채연카2", owner: "채연2")
    @State var name:String = ""
    
    var body: some View {
        
        VStack{
            TextField("PlaceHolder", text: $name)
            Text("\(myCar.name)주인은 \(myCar.owner)입니다.")
            Text("\(myKar.name)주인은 \(myKar.owner)입니다.")
            Text(name + "뭐니?")
            Button{
//                let broKar = myKar
//                broKar.name = "동생차"
//                broKar.owner = "동생"
                
                var broCar = myCar
                broCar.name = "동생차"
                broCar.owner = "동생"
                
                //myCar.sayHi()
                broCar.sayHi()
            } label: {
                Text("출발")
            }
        }
    }
}

struct Car {
    var name: String
    var owner: String
    
    func sayHi()
    {
        print("Hi \(owner)")
    }
}

//class는 struct와 모양이 같지만 Observable이 가능하다.
class Kar: ObservableObject { //클래스는 얘를 구웠을 때 어떻게 생겨먹었는지까지도 기입해줘야함
    @Published var name: String
    var owner: String
    
    init(name: String, owner: String) {
        self.name = name
        self.owner = owner
    }
    
    func sayHi()
    {
        print("Hi \(owner)")
    }
}

#Preview {
    Diff()
}
