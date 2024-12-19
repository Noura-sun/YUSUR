//
//  EndIhram.swift
//  YUSUR
//
//  Created by shaden  on 18/06/1446 AH.
import Foundation
import SwiftUI

struct EndIhram: View {
    @State private var selectedGender: String = "Men" // Default is Men
    let progressSteps = ["Ihram", "Tawaf", "Sa’i", "Hair Trimming"] // Non-clickable steps
    
    var body: some View {
        NavigationView {
            VStack {
                // Title
                HStack {
                    Image("Kaaba") // Placeholder for Umrah Guide Icon
                        .resizable().frame(width: 35, height: 35 )
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                       
                    Text("Umrah Guide")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                
                // Progress Bar (Non-clickable)
               
                HStack(spacing: 0) { // Set spacing to 0 for seamless connections
                    ForEach(progressSteps.indices, id: \.self) { index in
                        HStack(spacing: 0) { // Adjust spacing within each step and line group
                            // Step Block
                            Text(progressSteps[index])
                                .font(.footnote)
                                .foregroundColor(index == 0 ? .white : .black)
                                .frame(width: 64, height: 41)
                                .background(index == 0 ? Color("ButtonOnboarding") : Color("fontOnboarding"))
                                .cornerRadius(6)
                            
                            // Connecting Line (only if not the last step)
                            if index < progressSteps.count - 1 {
                                Rectangle()
                                    .frame(height: 2) // Line thickness
                                    .foregroundColor(Color.gray.opacity(0.5))
                            }
                        }
                    }
                }
                .padding(.horizontal) // gaive spase in first and last step
                .padding(.top)
                
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                      
                     
                        // Gender Picker and Rules Box
                        VStack(alignment: .leading, spacing: 8) {
                            // Title and Picker in a Horizontal Stack
                            HStack {
                                Text("**Rules of Ihram:**")
                                    .font(.headline)
                                Spacer()
                                Picker(selection: $selectedGender, label: Text("")) {
                                    Text("Women").tag("Women")
                                    Text("Men").tag("Men")
                                }
                                .pickerStyle(SegmentedPickerStyle())
                                .frame(width: 160)
                            }
                            .padding(.bottom, 8) // Space between picker and text

                            // Rules Text
                            Text(selectedGender == "Men" ?
                                "Trim a small portion of hair (equal to the length of a fingertip)." :
                                "Women should wear modest clothing that covers the body but does not include the face and hands.")
                                .font(.body)
                                .padding(.top, 4)
                        }
                        .padding()
                        .background(Color.brown.opacity(0.2)) // Box background color
                        .cornerRadius(8)
                        
                    
                        Text("O Allah, all praise is for You Alone. You have beautified my creation and adorned me with hair. Make this (act of hair trimming) a purification and blessing for me, forgive my sins, and accept my worship.")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }
                
                // Bottom Buttons
                HStack {
                    Button(action: {
                        print("Back pressed")
                    }) {
                        Text("Back")
                            .frame(width: 100, height: 4)
                            .padding()
                            .background(Color("ButtonOnboarding"))
                            .cornerRadius(100)
                        Spacer()
                    }
                    
                    .foregroundColor(.white)
                    
                    Button(action: {
                        print("Continue pressed")
                    }) {
                        Text("Continue")
                            .frame(width: 100, height: 4)
                            .padding()
                            .background(Color("ButtonOnboarding"))
                            .foregroundColor(.white)
                            .cornerRadius(100)
                    }
                }
                .padding()
            }
        }
    }
}

struct EndIhram_Previews: PreviewProvider {
    static var previews: some View {
        EndIhram()
    }
}
