//
//  Option.swift
//  FastSwiftBasic
//
//  Created by 정채연 on 1/1/24.
//

import SwiftUI

struct Option: View {
    
    var leeo: People? = People(name: "Leeo", mbti: MBTI(name: "ENFP"))
    var chaen = People(name: "Chaen", petName: "cookie")
    var dami = People(name: "Dami", petName: "coco")
    
    var body: some View {
        
        VStack{
            if let leeo = leeo {
                if let mbti = leeo.mbti {
                    if let name = mbti.name{
                        
                    }
                }
            }
            
            if let leeoMbtiName = leeo?.mbti?.name {
                Text(leeoMbtiName)
            }else {
                Text("No MBTI Name")
            }
            
            if let name = leeo?.name{ 
                if let petName = leeo?.petName {
                    Text("이름은 \(name), 애완동물 이름은 \(petName)")
                } else {
                    Text("이름은 \(name), 애완동물은 없어요")
                }
            }
            
            if let petName = chaen.petName {
                Text("이름은 \(chaen.name), 애완동물 이름은 \(petName)")
            }
        }
    }
}

struct People {
    let name: String
    var petName: String?
    var mbti: MBTI?
}

struct MBTI {
    var name: String?
    
}

#Preview {
    Option()
}
