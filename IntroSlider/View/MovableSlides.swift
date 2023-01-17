//
//  MovableSlides.swift
//  IntroSlider
//
//  Created by Norbert Horváth on 2023. 01. 17..
//

import SwiftUI

struct MovableSlides: View {
    @Binding var currentIndex: Int
    @Binding var item: OnboardingItem
    @State var size: CGSize

    var body: some View {
        VStack(spacing: 15) {
            let offset = -CGFloat(currentIndex) * size.width
            ResizableLottieView(onboardingItem: $item)
                .frame(height: size.width)
                .onAppear {
                    if currentIndex == .zero { item.lottieView.play(toProgress: 0.99) }
                }
                .offset(x: offset)
                .animation(.easeInOut(duration: 0.5), value: currentIndex)
            
            Text(item.title)
                .font(.title.bold())
                .offset(x: offset)
                .animation(.easeInOut(duration: 0.5).delay(0.1), value: currentIndex)
            
            Text(item.subtitle)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 15)
                .foregroundColor(.gray)
                .offset(x: offset)
                .animation(.easeInOut(duration: 0.5).delay(0.2), value: currentIndex)
        }
    }
}


struct MovableSlides_Previews: PreviewProvider {
    static var previews: some View {
        MovableSlides(currentIndex: .constant(0),
                      item: .constant(OnboardingItem.mock.first!),
                      size: CGSize(width: 200, height: 200))
    }
}
