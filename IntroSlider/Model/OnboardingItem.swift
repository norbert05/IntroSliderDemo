//
//  OnboardingItem.swift
//  IntroSlider
//
//  Created by Norbert Horváth on 2022. 12. 31..
//

import Lottie
import SwiftUI

struct OnboardingItem: Identifiable, Equatable {
    var id: UUID = .init()
    var title: String
    var subtitle: String
    var lottieView: LottieAnimationView = .init()
    
    static let mock: [OnboardingItem] = [
        .init(title: "Request Pickup",
              subtitle: "Tell us who you're sending it to, what you're sending and when it's best to pickup the package and we will pick it up at the most convenient time",
              lottieView: .init(name: "lottie1", bundle: .main)),
        .init(title: "Track Delivery",
              subtitle: "The best part starts when our courier is on the way to your location, as you will get real time notifications as to the exact location of the courier",
              lottieView: .init(name: "lottie2", bundle: .main)),
        .init(title: "Receive Package",
              subtitle: "The journey ends when your package get to it's location. Get notified immediately your package is received at its intended location",
              lottieView: .init(name: "lottie3", bundle: .main))
    ]
}
