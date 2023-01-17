//
//  ButtonStack.swift
//  IntroSlider
//
//  Created by Norbert Horváth on 2023. 01. 18..
//

import SwiftUI

struct ButtonStack: View {
    @Binding var currentIndex: Int
    @Binding var onboardingItems: [OnboardingItem]

    var body: some View {
        VStack(spacing: 15) {
            Text("Next")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background() {
                    Capsule().fill(.green)
                }
                .padding(.horizontal, 100)
                .onTapGesture {
                    if currentIndex < onboardingItems.count - 1 {
                        onboardingItems[currentIndex].lottieView.pause()
                        currentIndex += 1
                        onboardingItems[currentIndex].lottieView.currentProgress = 0
                        onboardingItems[currentIndex].lottieView.play(toProgress: 0.99)
                    }
                }
            
            HStack {
                Text("Terms of Service")
                Text("Privacy Policy")
            }
            .font(.caption2)
            .underline(true, color: .primary)
            .offset(y: 5)
        }
    }
}


struct ButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStack(currentIndex: .constant(0), onboardingItems: .constant(OnboardingItem.mock))
    }
}
