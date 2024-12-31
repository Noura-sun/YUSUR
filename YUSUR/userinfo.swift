//
//  userinfo.swift
//  YUSUR
//
//  Created by Rimas Alshahrani on 29/06/1446 AH.
import SwiftUI

struct UserinfoView: View {
    @State private var name: String = ""
    @State private var gender: String = ""
    @State private var genders = ["Male", "Female"]
    @State private var navigateToInstructions = false // Navigation state
    
    var body: some View {
        NavigationView {
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
                            Text("Welcome")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            // Name TextField
                            TextField("Name", text: $name)
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                            
                            // Gender Picker
                            Menu {
                                ForEach(genders, id: \.self) { genderOption in
                                    Button(action: {
                                        gender = genderOption
                                    }) {
                                        Text(genderOption)
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(gender.isEmpty ? "Gender" : gender)
                                        .foregroundColor(gender.isEmpty ? .gray : .black)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                            }
                            
                            // Smaller Rounded Next Button
                            Button(action: {
                                navigateToInstructions = true // Trigger navigation
                            }) {
                                Text("Next")
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 220, height: 40) // Smaller button dimensions
                                    .background(Color.userbb) // Adjust the color
                                    .cornerRadius(20) // Fully rounded edges
                            }
                        }
                        .padding()
                        .background(BlurView(style: .systemUltraThinMaterial)) // Subtle blur effect
                        .cornerRadius(20)
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 400) // Taller box
                        .padding(.horizontal, 20)
                    }
                    
                    Spacer()
                }
                // Navigation link to InstructionView
                NavigationLink(
                    destination: InstructionView().navigationBarHidden(true), // Hides back button
                    isActive: $navigateToInstructions,
                    label: { EmptyView() }
                )
            }
            .navigationBarHidden(true) // Hides navigation bar in UserinfoView
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Prevents navigation back button
    }
}

// Custom Blur View
struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return blurView
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct UserinfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserinfoView()
    }
}






