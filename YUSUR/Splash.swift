//
//  Splash.swift
//  YUSUR
//
//  Created by shaden  on 11/06/1446 AH.
//

import SwiftUI

struct Splash: View {
    @State private var isActive = false

    var body: some View {
        Group {
            if isActive {
                MainAppView() // Main App View
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

// Placeholder for the Main App View
struct MainAppView: View {
    var body: some View {
        Text("Main App View")
            .font(.title)
            .fontWeight(.bold)
    }
}

// Preview
struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
