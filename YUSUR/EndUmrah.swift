//
//  EndUmrah.swift
//  YUSUR
//
//  Created by Rimas Alshahrani on 01/07/1446 AH.
import SwiftUI

struct UmrahBlessingView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("Onboarding end") // Replace with your actual image name
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                // Blur Box
                VStack {
                    Spacer() // This Spacer keeps the blur box and text in place

                    Text("May Allah accept your Umrah\nand grant you its reward and blessings.")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.8, maxHeight: 200) // Bigger box
                        .background(
                            BlurEffectView(style: .systemUltraThinMaterial) // Blur effect
                                .cornerRadius(15)
                        )
                        .padding(.horizontal, 40)

                    Spacer() // Pushes the button upwards

                    // Start Now Button (Moved higher)
                    NavigationLink(destination:OnboardingView()) {
                        Text("Exit")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: 50) // Fixed button size
                            .background(Color("Color 1")) // Use your custom color
                            .cornerRadius(25)
                            .shadow(radius: 5) // Optional shadow for the button
                    }
                    .padding(.bottom, 50) // This moves the button up while keeping the blur box in place
                }
            }
            .navigationBarBackButtonHidden(true) // Remove the back button
        }
    }
}

// Custom Blur Effect View
struct BlurEffectView: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return blurView
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct UmrahBlessingView_Previews: PreviewProvider {
    static var previews: some View {
        UmrahBlessingView()
    }
}




