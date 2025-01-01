//
//  OnBoarding.swift
//  YUSUR
//
//  Created by shaden  on 11/06/1446 AH.
//
import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("Onboarding 6")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height) // Fixed to screen size
                    .ignoresSafeArea()
                
                VStack {
                    Spacer() // Push the content down slightly
                    
                    // Logo and Text Section
                    VStack(spacing: 16) {
                        // Logo
                        Image("Aldenaire") // Replace with your actual logo name
                            .resizable()
                            .scaledToFit()
                            .padding(.leading, -70) // Move logo to the left
                            .frame(width: 600, height: 600) // Adjust logo size to match the screenshot
                            .padding(.bottom, 80)
                    }
                    
                    Spacer() // Push the button to the bottom
                    
                    // Start Button
                    NavigationLink(destination: InstructionView()) {
                        Text("Start Now")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: 50) // Fixed button size
                            .background(Color("Color 1")) // Use your custom color
                            .cornerRadius(25)
                            .shadow(radius: 5) // Optional shadow for the button
                    }
                    .padding(.bottom, 100) // Add space from the bottom edge
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}


