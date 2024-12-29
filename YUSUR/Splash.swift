//
//  Splash.swift
//  YUSUR
//
//  Created by shaden  on 11/06/1446 AH.
//

import SwiftUI

struct Splash: View {
    @State private var isActive = false
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        Group {
            if isActive {
                if hasSeenOnboarding {
                    IhramView()
                               } else {
                                   OnboardingView()
                               }
                           } else {
                VStack(spacing: 20) {
                    // Logo with detailed design
                    Image("Splash") // Replace with your asset name in Assets.xcassets
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 220) // Adjust size to match design
              
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white) // Background color
                .ignoresSafeArea()
            }
        }
        .onAppear {
            // Delay to simulate a splash screen effect
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}


// Preview
struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
