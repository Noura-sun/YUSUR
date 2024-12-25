//
//  Sai.swift
//  YUSUR
//
//  Created by Rimas Alshahrani on 18/06/1446 AH.
//
import SwiftUI

struct Sai: View {
    @State private var counter = 0 // To track the count
    @State private var selectedTab = 0 // Tracking the tab for swipe
    
    // Progress steps
    private let progressSteps = ["Ihram", "Tawaf", "Sa’i", "Hair Trimming"]
    
    var body: some View {
        NavigationView {
            VStack {
                // Navigation Bar
                VStack {
                    // Title
                    HStack {
                        Image("kaba 1")
                            .resizable()
                            .frame(width: 35, height: 35)
                        
                        Text("Umrah Guide")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    Divider()
                    // Progress Bar (Non-clickable)
                    HStack(spacing: 0) {
                        ForEach(progressSteps.indices, id: \.self) { index in
                            HStack(spacing: 0) {
                                // Step Block
                                Text(progressSteps[index])
                                    .font(.footnote)
                                    .foregroundColor(index == 2 ? .white : .black)
                                    .frame(width: 74, height: 54)
                                    .background(index == 2 ? Color.buttonOnboarding : Color.gray.opacity(0.3))
                                    .cornerRadius(15)
                                
                                // Connecting Line (only if not the last step)
                                if index < progressSteps.count - 1 {
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundColor(Color.gray.opacity(0.5))
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
                
                // Main Content
                ScrollView {
                    VStack(spacing: 30) {
                        // Sa’i Description
                        Text("\nSa’i (Between Safa and Marwa ) :")
                            .font(.headline)
                            .multilineTextAlignment(.center)

                        Text("Walking from Safa to Marwah is one round, and returning from Marwah to Safa is another. Complete seven rounds, starting at Safa and ending at Marwah.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)

                        // Counter Button
                        Button(action: {
                            if counter < 7 {
                                counter += 1
                                print("Count: \(counter)")
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Color.buttonOnboarding)
                                    .frame(width: 170, height: 170)

                                Text(counter == 0 ? "+" : "\(counter)") // "+" initially, then numbers
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()

                        Text(counter == 0 ? "start Round " : (counter == 7 ? "sa'i is completed!" : ""))
                            .font(.headline)

                        // Swipeable Circle Indicators
                        HStack(spacing: 10) {
                            ForEach(0..<2) { index in
                                Circle()
                                    .fill(index == selectedTab ? Color.brown : Color.gray)
                                    .frame(width: 10, height: 10)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Navigation Buttons
                HStack {
                    NavigationLink(destination: TawafView()) {
                        Text("Back")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color.buttonOnboarding)
                            .cornerRadius(20)
                    }
                    
                    NavigationLink(destination: EndIhramView()) {
                        Text("Continue")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color.buttonOnboarding)
                            .cornerRadius(20)
                    }
                }
            }
            .padding()
        }
    }
}

struct TawaffView: View {
    var body: some View {
        Text("Tawaf Page")
            .font(.largeTitle)
            .padding()
    }
}

struct EndIhramView: View {
    var body: some View {
        Text("EndIhram")
            .font(.largeTitle)
            .padding()
    }
}

struct Sai_Preview: PreviewProvider {
    static var previews: some View {
        Sai()
    }
}

