//
//  EndIhram.swift
//  YUSUR
//
//  Created by shaden  on 18/06/1446 AH.
import SwiftUI

struct EndIhram: View {
    @State private var selectedGender: String = "Men" // Default is Men
    @State private var selectedIndex = 0 // Track the current page for dots
    let progressSteps = ["Ihram", "Tawaf", "Sa’i", "Hair Trimming"] // Non-clickable steps
    let duas = [
        "O Allah, all praise is for You Alone. You have beautified my creation and adorned me with hair. Make this (act of hair trimming) a purification and blessing for me, forgive my sins, and accept my worship.",
        "O Allah, guide me and make me steadfast in my faith, and forgive my sins, and grant me success in all my affairs.",
        "O Allah, to You belongs all praise for the completion of blessings and the perfection of Your grace. O Allah, make me among those You are pleased with, forgive them, and have written for them the full reward of Umrah.",
        "O Allah, to You belongs all praise. You have beautified my creation and adorned my hair. Make it a source of purity and blessing for me. Forgive my sins and accept my worship."
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) { // Use VStack to structure all sections
                // Title and Progress Bar
                VStack {
                    // Title
                    HStack {
                        Image("kaba 1") // Placeholder for Umrah Guide Icon
                            .resizable()
                            .frame(width: 35, height: 35)
                        
                        Text("Umrah Guide")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Divider() // The line
                        .frame(height: 1) // Thickness of the line
                        .background(Color.gray.opacity(0.5))
                        .padding(.horizontal) // Add padding to match the layout
                    
                    // Progress Bar
                    HStack(spacing: 0) {
                        ForEach(progressSteps.indices, id: \.self) { index in
                            HStack(spacing: 0) {
                                Text(progressSteps[index])
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .frame(width: 64, height: 41)
                                    .background(Color("Color"))
                                    .cornerRadius(6)
                                
                                if index < progressSteps.count - 1 {
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundColor(Color("Color"))
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
                
                // Scrollable Content
                ScrollView {
                    VStack(spacing: 20) {
                        // Gender Picker and Rules Box
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("**Rules of Hair Trimming:**")
                                    .font(.headline)
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
                                 "Women should wear modest clothing that covers the body but does not include the face and hands.")
                                .font(.body)
                                .padding(.top, 4)
                        }
                        .padding()
                        .background(Color("Color").opacity(0.2))
                        .cornerRadius(8)
                        .padding()
                        
                        // Swipeable Dua Section
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
                            
                            // Custom Navigation Dots
                            HStack(spacing: 6) {
                                ForEach(0..<duas.count, id: \.self) { index in
                                    Circle()
                                        .fill(selectedIndex == index ? Color("Color") : Color.secondary.opacity(0.4))
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
                }
                
                // Bottom Button with Navigation Link
                HStack {
                    NavigationLink(destination: Sai().navigationBarBackButtonHidden(true)) { // Replace SaiView() with your Sa’i view
                        Text("Back")
                            .frame(width: 100, height: 4)
                            .padding()
                            .background(Color("Color"))
                            .cornerRadius(25)
                            .foregroundColor(.white)
                    }
                    Spacer() // Push the Back button to the left
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
