//
//  OnboardingScreen.swift
//  IntroSlider
//
//  Created by Norbert Horváth on 2022. 12. 31..
//

import SwiftUI

struct OnboardingScreen: View {
    
    // MARK: OnBoarding Slides Model Data
    @State var onboardingItems = OnboardingItem.mock
    @State var currentIndex: Int = 0
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            HStack(spacing: 0) {
                ForEach($onboardingItems) { $item in
                    VStack {
                        // MARK: Top nav bar
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
                        
                        // MARK: Movable slides
                        VStack(spacing: 15) {
                            let offset = -CGFloat(currentIndex) * size.width
                            ResizableLottieView(onboardingItem: $item)
                                .frame(height: size.width)
                                .onAppear {
                                    // MARK: Initially playing first slide animation
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
                        
                        Spacer(minLength: 0)
                        
                        // MARK: - Next / Login button
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
                                    // MARK: - updating to enxt index
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
                    .padding(15)
                    .frame(width: size.width, height: size.height)
                } 
            }
            .frame(width: size.width * CGFloat(onboardingItems.count), height: size.height, alignment: .leading)
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
