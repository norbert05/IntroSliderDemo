//
//  ResizableLottieView.swift
//  IntroSlider
//
//  Created by Norbert Horváth on 2023. 01. 18..
//

import SwiftUI

struct ResizableLottieView: UIViewRepresentable {
    @Binding var onboardingItem: OnboardingItem
    
    func makeUIView(context: Context) -> some UIView {
        getLottieView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
    
    func getLottieView() -> UIView {
        let containerView = UIView().then {
            $0.backgroundColor = .clear
        }
        
        let lottieView = onboardingItem.lottieView.then {
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            lottieView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: containerView.heightAnchor),
        ])
        
        return containerView
    }
}

struct ResizableLottieView_Previews: PreviewProvider {
    static var previews: some View {
        ResizableLottieView(onboardingItem: .constant(OnboardingItem.mock.first!))
    }
}
