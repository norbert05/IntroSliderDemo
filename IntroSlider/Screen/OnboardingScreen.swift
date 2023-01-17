//
//  OnboardingScreen.swift
//  IntroSlider
//
//  Created by Norbert Horváth on 2022. 12. 31..
//

import SwiftUI

struct OnboardingScreen: View {
    @State var onboardingItems = OnboardingItem.mock
    @State var currentIndex: Int = 0
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            HStack(spacing: 0) {
                ForEach($onboardingItems) { $item in
                    VStack {
                        TopNavBar(currentIndex: $currentIndex, onboardingItems: $onboardingItems)
                        MovableSlides(currentIndex: $currentIndex, item: $item, size: size)
                        Spacer(minLength: 0)
                        ButtonStack(currentIndex: $currentIndex, onboardingItems: $onboardingItems)
                    }
                    .padding(15)
                    .frame(width: size.width)
                }
            }
        }
    }
    
    // MARK: - retreving index of the item in the array
    func indexOf(_ item: OnboardingItem) -> Int {
        onboardingItems.firstIndex(of: item) ?? 0
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
