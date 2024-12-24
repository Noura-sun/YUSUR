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
                Image("OnBoarding")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea() // Ensure it covers the entire screen
                
                VStack {
                    Spacer() // Push content to the bottom
                    
                    // Title Section
                    Text("The Ultimate Umrah Guide at Your Fingertips")
                        .font(.custom("Amiri-Regular", size: 24)) // Use your preferred font
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 20)
                    
                    // Start Button
                    NavigationLink(destination: UmrahGuideView().navigationBarBackButtonHidden(true)) {
                        Text("Start Now")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("ButtonOnboarding")) // Use your custom color
                            .cornerRadius(20)
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 50)
                }
                .padding(.bottom, 100) // Space from the bottom edge
            }
        }
    }
}
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
