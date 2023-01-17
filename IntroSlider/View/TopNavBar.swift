//
//  TopNavBar.swift
//  IntroSlider
//
//  Created by Norbert Horváth on 2023. 01. 17..
//

import SwiftUI

struct TopNavBar: View {
    @Binding var currentIndex: Int
    @Binding var onboardingItems: [OnboardingItem]

    var body: some View {
        HStack {
            Button("Back") {
                if currentIndex > 0 {
                    onboardingItems[currentIndex].lottieView.pause()
                    currentIndex -= 1
                    onboardingItems[currentIndex].lottieView.currentProgress = 0
                    onboardingItems[currentIndex].lottieView.play(toProgress: 0.99)
                }
            }
            Spacer()
            Button("Skip") { }
        }
        .tint(.green)
        .fontWeight(.bold)
    }
}


struct TopNavBar_Previews: PreviewProvider {
    static var previews: some View {
        TopNavBar(currentIndex: .constant(0), onboardingItems: .constant(OnboardingItem.mock))
    }
}
