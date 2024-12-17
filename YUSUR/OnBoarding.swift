//
//  OnBoarding.swift
//  YUSUR
//
//  Created by shaden  on 11/06/1446 AH.
//
import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            // Background Image
            Image("OnBoarding")
                .resizable()
                .ignoresSafeArea() // Ensure it covers the entire screen
            
            VStack {
                Spacer()
                
                // Card Section
                VStack {
                    // Header Text
                    Text("ابدأ الآن")
                        .font(.custom("AmiriQuranColored-Regular", size: 24)) // Replace with correct PostScript name
                        .bold()
                   .foregroundColor(Color("fontOnboarding")) // Use custom color
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .background(Color("ButtonOnboarding"))
                .cornerRadius(20)
                .padding(.horizontal, 20)
                .padding(.bottom, 50)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
