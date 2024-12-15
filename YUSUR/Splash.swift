//
//  Splash.swift
//  YUSUR
//
//  Created by shaden  on 11/06/1446 AH.
//

import SwiftUI

struct Splash: View {
    // State variable to manage navigation
    @State private var isActive = false

    var body: some View {
        if isActive {
            // Navigate to the Main App View after the splash screen
            MainAppView()
        } else {
            VStack {
                // Splash Screen Content
                Image(systemName: "swift") // Replace with your app logo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
                Text("Welcome to My App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .ignoresSafeArea()
            .onAppear {
                // Delay for 3 seconds before navigating to the main app
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}


