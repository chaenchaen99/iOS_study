//
//  MyCar.swift
//  FastSwiftBasic
//
//  Created by 정채연 on 1/2/24.
//

import SwiftUI
/**
 프로토콜을 설계하고,
 그것을 채택하고,
 채택한 것들이 규약이 된다.
 */
struct MyCar: View {
    
    var myCar: KIA = KIA()
    var broCar: Hyundai = Hyundai()
    let cars: [Driveable] = [KIA(), Hyundai()] //어떤 객체가 같은 설계를 갖고있다면 묶일 수 있다.
   
    @State var speed: Int = 0
    var body: some View {
        VStack{
            Text("speed:\(speed)")
            Button {
                speed = broCar.speedDown(with: speed)
                cars.randomElement()?.speedDown(with: speed)
            } label: {
                Text("감속")
            }
        }
    }
}
struct Hyundai : Driveable {
    func speedDown(with speed: Int) -> Int {
        print("속도가 \(speed-9)으로 줄어듭니다")
        return speed - 9
    }
}
struct KIA : Driveable {
    func speedDown(with speed: Int) -> Int {
        print("속도가 \(speed-5)으로 줄어듭니다.")
        return speed - 5
    }
}

protocol Driveable {
    func speedDown(with speed: Int) -> Int
}

#Preview {
    MyCar()
}
