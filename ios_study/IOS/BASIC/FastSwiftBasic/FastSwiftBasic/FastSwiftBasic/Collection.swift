//
//  Collection.swift
//  FastSwiftBasic
//
//  Created by 정채연 on 12/30/23.
//

import SwiftUI

/*
 Array : 배열
 중복 가능
 순서가 있음
 
 Set : 한국어로 하면 집합, Array와 비슷
 let musics: Set<String> = ["Rock", "Jazz", "Classical"]
 부분집합, 교집합, 합집합 등 가능
 같은 요소들은 제거( 중복 제거)
 순서가 없음
 
 Dictionary : 키 밸류를 가진 사전
 var dict = ["XYZ": "Toronto Pearson"]
 dict["XYZ"]
 */
struct Collection: View {
    
    let name: String = "Chaen" //한번 넣으면 바꿀 수 X
    var name_: String = "Chaen" //재사용 가능
    
    var foods: [String] = ["eggs", "tomatoes", "pineapples"]
    var jazzs: Set<String> = ["bibidu", "ovan", "ggungdi"]
    var hiphob: Set<String> = ["ovan", "lilamals", "jayPark"]
    var koEnDict: [String: String] = ["사과":"Apple", "바나나":"Banana"]
    
    var body: some View {
        VStack{
           Text(koEnDict["사과"]!)
            Text(koEnDict["바나나"]!)
        }
    }
}

#Preview {
    Collection()
}
