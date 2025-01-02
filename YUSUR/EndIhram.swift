//
//  EndIhram.swift
//  YUSUR
//
//  Created by shaden  on 18/06/1446 AH.
//
import SwiftUI

struct EndIhram: View {
    @State private var selectedGender: String = "Men" // Default is Men
    @State private var selectedIndex = 0
    @State private var showHelpModal: Bool = false // State to show or hide the help modal

    let progressSteps = ["Ihram", "Tawaf", "Sa’i", "End Ihram"]
    let duas = [
        "O Allah, all praise is for You Alone. You have beautified my creation and adorned me with hair. Make this (act of hair trimming) a purification and blessing for me, forgive my sins, and accept my worship.",
        "O Allah, guide me and make me steadfast in my faith, and forgive my sins, and grant me success in all my affairs.",
        "O Allah, to You belongs all praise for the completion of blessings and the perfection of Your grace. O Allah, make me among those You are pleased with, forgive them, and have written for them the full reward of Umrah.",
        "O Allah, to You belongs all praise. You have beautified my creation and adorned my hair. Make it a source of purity and blessing for me. Forgive my sins and accept my worship."
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    // Add the question mark button
                    HStack {
                        Button(action: {
                            showHelpModal = true
                        }) {
                            Image(systemName: "questionmark.circle")
                                .font(.title2)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading)
                        Spacer()
                    }
                    .padding(.top, 20)
                    
                    // Progress Bar
                    HStack(spacing: 0) {
                        ForEach(progressSteps.indices, id: \.self) { index in
                            HStack(spacing: 0) {
                                Text(progressSteps[index])
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .frame(width: 64, height: 41)
                                    .background(Color("Color 1"))
                                    .cornerRadius(6)
                                
                                if index < progressSteps.count - 1 {
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundColor(Color("Color 1"))
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    // Scrollable Content
                    ScrollView {
                        Spacer().frame(height: 15)
                        VStack(alignment: .leading, spacing: 1) {
                            Text("End Ihram")
                                .font(.custom("Amiri-Regular", size: 20))
                                .padding(.bottom, 12)
                                .padding(.top, 12)
                                .padding(.leading, 14)
                            Text("Now the final step of Umrah: Ending Ihram.")
                                .padding(.leading, 14)
                                .font(.custom("Amiri-Regular", size: 16))
                                .lineSpacing(2)
                                .padding(.top, 10)
                            
                            // Gender Picker and Rules Box
                            VStack(alignment: .leading, spacing: 20) {
                                HStack {
                                    Text("Rules of End Ihram")
                                        .font(.custom("Amiri-Bold", size: 18))
                                        .fontWeight(.bold)
                                    Spacer()
                                    Picker(selection: $selectedGender, label: Text("")) {
                                        Text("Women").tag("Women")
                                        Text("Men").tag("Men")
                                    }
                                    .pickerStyle(SegmentedPickerStyle())
                                    .frame(width: 160, height: 50)
                                }
                                Text(selectedGender == "Men" ?
                                     "Trim a small portion of hair (equal to the length of a fingertip)." :
                                     "Trim the tips of the hair, not exceeding the length of a fingertip.")
                                .font(.body)
                                .padding(.top, 10)
                            }
                            .padding()
                            .background(Color("Color 1").opacity(0.2))
                            .cornerRadius(8)
                            .padding()
                            
                            // Dua Section
                            VStack {
                                TabView(selection: $selectedIndex) {
                                    ForEach(0..<duas.count, id: \.self) { index in
                                        Text(duas[index])
                                            .font(.custom("Amiri-Regular", size: 18))
                                            .multilineTextAlignment(.center)
                                            .padding()
                                            .tag(index)
                                    }
                                }
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                                .frame(height: 200)
                                
                                // Dots
                                HStack(spacing: 6) {
                                    ForEach(0..<duas.count, id: \.self) { index in
                                        Circle()
                                            .fill(selectedIndex == index ? Color("Color 1") : Color.secondary.opacity(0.4))
                                            .frame(width: 8, height: 8)
                                            .onTapGesture {
                                                withAnimation {
                                                    selectedIndex = index
                                                }
                                            }
                                    }
                                }
                            }
                        }
                        
                        // Navigation Buttons
                        Spacer().frame(height: 130)
                        HStack {
                            NavigationLink(destination: SaiView().navigationBarBackButtonHidden(true)) {
                                Text("Back")
                                    .frame(width: 100, height: 4)
                                    .padding()
                                    .background(Color("Color 1"))
                                    .cornerRadius(25)
                                    .foregroundColor(.white)
                            }
                            Spacer().frame(width: 102)
                            NavigationLink(destination: UmrahBlessingView()) {
                                Text("Continue")
                                    .frame(width: 100, height: 4)
                                    .padding()
                                    .background(Color("Color 1"))
                                    .foregroundColor(.white)
                                    .cornerRadius(100)
                                    .font(.custom("Amiri-Bold", size: 18))
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, -9)
                    }
                    .navigationBarBackButtonHidden(true)
                }
                
                // Help Modal
                if showHelpModal {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Text("Welcome to the Umrah Guide App!")
                            .font(.custom("AnnapurnaSIL-Bold", size: 18))
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 1)
                            .padding(.top,25)
                        
                        Text("""
                        We strive to provide you with a unique and seamless experience to help you perform Umrah with ease. Please read the following instructions to make the most out of the app:

                        How to Use App:

                        1. Ihram:  
                           • Read the intentions and recommended 
                             supplications.
                        
                        2. Tawaf:  
                           • Use the counter to track each round.  
                           • Supplications will appear for each round.
                        
                        3. Sa’i:  
                           • Track your 7 rounds between Safa and Marwah 
                             using the counter.
                        
                        4. Hair Trimming/Shaving:  
                           • Follow the rules based on your gender.

                        Notes:  
                           • Use the counter after each round to avoid errors.  
                           • The progress bar shows your current and 
                             remaining steps.  
                        """)
                        .font(.custom("AnnapurnaSIL-Regular", size: 13))
                        .multilineTextAlignment(.leading)
                        .padding(.vertical)
                        .lineSpacing(4)

                        Button(action: {
                            showHelpModal = false
                        }) {
                            Text("Close")
                                .font(.custom("Amiri-Bold", size: 16))

                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 200, height: 40) // Set button size
                                .background(Color.color6)
                                .cornerRadius(100)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 10)
                    .padding(30)
                }
            }
        }
    }
}

struct EndIhram_Previews: PreviewProvider {
    static var previews: some View {
        EndIhram()
    }
}

