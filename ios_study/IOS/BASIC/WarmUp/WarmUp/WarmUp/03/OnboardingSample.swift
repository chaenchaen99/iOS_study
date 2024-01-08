//
//  Onboarding1.swift
//  WarmUp
//
//  Created by 정채연 on 1/8/24.
//

import SwiftUI

struct OnboardingSample: View {
    
    let onboardingTitle: String
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            Text(onboardingTitle)
        }
    }
}

#Preview {
    OnboardingSample(onboardingTitle: "온보딩 테스트", backgroundColor: .brown)
}
