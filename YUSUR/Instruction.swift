//
//  Instruction.swift
//  YUSUR
//
//  Created by Rimas Alshahrani on 29/06/1446 AH.
//
import SwiftUI

struct InstructionView: View {
    var body: some View {
        ZStack {
            // Background Image
            Image("Onboarding 6") // Replace with your image name
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            // Content with blur box
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    // Taller Blur Box
                    VStack(spacing: 20) {
                        Text("Welcome to the Umrah Guide App!") // Place your instruction text here
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black) // Replace with your custom color if needed
                            .multilineTextAlignment(.center) // Center the text
                        
                        Text("We strive to provide you with a unique and seamless experience to help you perform Umrah with ease. Please read the following instructions to make the most out of the app:") // Place your instruction text here
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.black) // Replace with your custom color if needed
                            .multilineTextAlignment(.center) // Center the text
                        
                        Text("How to use : ") // Place your instruction text here
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black) // Replace with your custom color if needed
                            .multilineTextAlignment(.leading) // Align the text to the left
                            .frame(maxWidth: .infinity, alignment: .leading) // Ensure it stretches across the screen with left alignment
                        Text("1.Ihram:\n.Read the intentions and recommended   supplications.\n2.Tawaf:\n.Use the counter to track each round .\nSupplications will appear for each round.\n3.Sa’i:\n.Track your 7 rounds between Safa and Marwah using the counter.\n4.Hair Trimming/Shaving:\n.Follow the rules based on your gender") // Place your instruction text here
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.black) // Replace with your custom color if needed
                            .multilineTextAlignment(.leading) // Align the text to the left
                        Text("Note!") // Place your instruction text here
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black) // Replace with your custom color if needed
                            .frame(maxWidth: .infinity, alignment: .leading) // Ensure it stretches HStack {
                        Text("*Use the counter after each round to avoid errors.\n*The progress bar shows your current and remaining steps.\n*You can return to this instructions page by clicking on this ")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.black) // Replace with your custom color if needed
                            .multilineTextAlignment(.leading) // Align the text to the left
                        
                        Image("info") // Replace with your image name or system image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24) // Adjust the size as needed
                        
                    }
                    .padding(.horizontal, 20) // Optional: add horizontal padding for spacing
    
                    .padding()
                    .background(CustomBlurView(style: .systemUltraThinMaterial)) // Subtle blur effect
                    .cornerRadius(20)
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 700) // Adjust the box height as needed
                    .padding(.horizontal, 20)
                }
                
                Spacer()
            }
        }
    }
}

// Custom Blur View
struct CustomBlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return blurView
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
    }
}


