//
//  Instruction.swift
//  YUSUR
//
//  Created by Rimas Alshahrani on 29/06/1446 AH.
//
import SwiftUI

struct InstructionView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("Onboarding 6")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    // Single blurred box for all content
                    VStack(spacing: 20) {
                        VStack(spacing: 10) {
                            Text("Welcome to YUSUR \n your Umrah Guide App!")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .minimumScaleFactor(0.8)
                            
                            Text("""
                            We strive to provide you with a seamless experience to help you perform Umrah with ease. Please follow these instructions:
                            """)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .minimumScaleFactor(0.8)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("How to use:")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                
                                Text("""
                                1. Ihram:
                                   - Read the intentions and recommended supplications.
                                2. Tawaf:
                                   - Use the counter to track each round.
                                   - Supplications will appear for each round.
                                3. Sa’i:
                                   - Track your 7 rounds between Safa and Marwah using the counter.
                                4. EndIhram /Shaving:
                                   - Follow the rules based on your gender.
                                """)
                                    .font(.body)
                                    .foregroundColor(.black)
                            }
                            
                            Text("Note:")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("""
                            * Use the counter after each round to avoid errors.
                            * The progress bar shows your current and remaining steps.
                            * You can return to this instructions page by clicking the info icon.
                            """)
                                .font(.body)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                            
                            VStack {
                                Image("info")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.black)
                            }
                        }
                        
                        // Start Umrah Button Inside the Same Blurred Box
                        NavigationLink(destination: IhramView()) {
                            Text("Start Umrah")
                                .frame(width: 180, height: 50)
                                .background(Color("Color 1")) // Your color here
                                .foregroundColor(.white)
                                .cornerRadius(25)
                                .font(.title2)
                                .padding(.top, 1) // Adds space between the text and the button
                        }
                    }
                    .padding()
                    .background(CustomBlurView(style: .systemUltraThinMaterial)) // Single blur for all content
                    .cornerRadius(20)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true) // Hides the back button
            .navigationBarHidden(true) // Completely hides the navigation bar if needed
        }
    }
}

// Custom Blur View
struct CustomBlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
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









