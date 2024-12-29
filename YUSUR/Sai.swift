//
//  Sai.swift
//  YUSUR
//
//  Created by Rimas Alshahrani on 18/06/1446 AH.
//
import SwiftUI
import _SwiftData_SwiftUI

struct SaiView: View {
    @State private var currentRound: Int = 0 // Current number of rounds
    @State private var isCompleted: Bool = false // To check if the counter has completed
    @State private var selectedIndex = 0 // Track selected dua in the TabView
    
    let progressSteps = ["Ihram", "Tawaf", "Sa'i", "Hair Trimming"] // List of steps with new order
    let duas = [
        "God is great, God is great, God is great, there is no god but God alone with no partner, to Him belongs dominion and to Him is praise, and He is capable of all things. There is no god but God alone. He fulfilled His promise, gave victory to His servant, and defeated the parties alone  ",
        "Oh God, You are A generous pardon. You love forgiveness, so forgive me.    ",
        "There is no god but God, He alone has no partner. To Him belongs dominion, and to Him is praise. He gives life and causes death, and He is capable of all things. There is no god but God alone. He has fulfilled His promise, given victory to His servant, and defeated the parties alone.  .",
        "Oh God, you are my Lord, there is no god but You. You created me and I am your servant, and I abide by Your covenant and promise as much as I can. I seek refuge in You from the evil of what I have done. I acknowledge Your grace upon me. I confess to you my sin, so forgive me, for He does not forgive sins."
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Top title and line
                VStack {
                    // Title
                    HStack {
                        Image("kaaba") // Placeholder for Umrah Guide Icon
                            .resizable().frame(width: 35, height: 35)
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                        
                        Text("Umrah Guide")
                            .font(.custom("Amiri-Bold", size: 32))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 2)
                        .padding(.horizontal, 1)
                        .padding(.bottom, 16)
                }
                
                HStack(spacing: 0) { // Set spacing to 0 for seamless connections
                    ForEach(progressSteps.indices, id: \.self) { index in
                        HStack(spacing: 0) { // Adjust spacing within each step and line group
                            // Step Block
                            Text(progressSteps[index])
                                .font(.custom("Amiri-Bold", size: 12))
                                .foregroundColor(index == 0 || index == 1 || index == 2 ? .white : .black) // Set "Ihram" and "Tawaf" to white text
                                .frame(width: 64, height: 41)
                                .background(index == 0 || index == 1 || index == 2 ? Color(hex: "#79634B") : (index == 2 || index == 3 ? Color(hex: "#E6D9CA") : Color.gray.opacity(0.3))) // Background color based on index
                                .cornerRadius(6)
                            
                            // Connecting Line (only if not the last step)
                            if index < progressSteps.count - 1 {
                                Rectangle()
                                    .frame(height: 2) // Line thickness
                                    .foregroundColor(
                                        index == 0 ? Color(hex: "#79634B") : // Line between "Ihram" and "Tawaf" is brown
                                        (index == 2 || index == 3 ? Color(hex: "#E6D9CA") : // Line between "Sa'i" and "Hair Trimming" is beige
                                         Color(hex: "#E6D9CA")) // Default is beige for other steps
                                    )
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                // Sai Description
                ScrollView {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Begin Sa'i from Safa towards Marwa: ")
                            .bold()
                        Text("""
                        Walk back and forth between Safa and Marwa seven times while engaging in prayers and supplications.
                        Remember to ask Allah for forgiveness and blessings during each lap.
                        """)
                        .font(.body)
                        .lineSpacing(2)
                    }
                    .padding(.horizontal, 18)
                    .padding(.top, 18)
                    
                    // Lap Counter
                    VStack {
                        ZStack {
                            Circle()
                                .fill(Color(hex: "#79634B"))
                                .frame(width: 150, height: 150)
                                .onTapGesture {
                                    if currentRound < 7 {
                                        currentRound += 1
                                    }
                                    if currentRound == 7 {
                                        isCompleted = true
                                    }
                                }
                            Text(currentRound == 0 ? "+" : "\(currentRound)")
                                .font(.system(size: 48))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding(.top, 40)
                        
                        Text(currentRound == 0 ? "Start round" : (currentRound == 7 ? "Sa'i Completed!" : ""))
                            .font(.custom("Amiri-Regular", size: 18))
                            .foregroundColor(.black)
                            .padding(.top, 0.1)
                    }
                    
                    VStack {
                        TabView(selection: $selectedIndex) {
                            ForEach(0..<duas.count, id: \.self) { index in
                                VStack {
                                    Spacer()
                                    
                                    Text(duas[index])
                                        .font(.title3)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                    
                                    Spacer()
                                }
                                .tag(index)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.white)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .frame(height: 200)
                        
                        HStack(spacing: 8) {
                            ForEach(0..<duas.count, id: \.self) { index in
                                Circle()
                                    .fill(selectedIndex == index ? Color.gray : Color.secondary.opacity(0.4))
                                    .frame(width: 10, height: 10)
                                    .onTapGesture {
                                        withAnimation {
                                            selectedIndex = index
                                        }
                                    }
                            }
                        }
                        .padding(.bottom)
                    }
                    .padding()
                    
                    Spacer()
                   
                // Bottom Buttons
                HStack {
                    NavigationLink(destination: TawafView()) { // Navigate to TawafView on Back
                        Text("Back")
                            .frame(width: 100, height: 4)
                            .padding()
                            .background(Color(hex: "#79634B"))
                            .foregroundColor(.white)
                            .cornerRadius(100)
                            .font(.custom("Amiri-Bold", size: 18))
                        
                    }
                    Spacer()
                    
                    NavigationLink(destination: EndIhram().navigationBarBackButtonHidden(true)) { // Navigate to HairTrimmingView on Continue
                        Text("Continue")
                            .frame(width: 100, height: 4)
                            .padding()
                            .background(isCompleted ? Color(hex: "#79634B") : Color.gray.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(100)
                            .font(.custom("Amiri-Bold", size: 18))
                        
                    }
                    .disabled(!isCompleted)
                }
                .padding(.horizontal)
                .padding(.bottom, 16)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct HairTrimmingView: View {
    var body: some View {
        Text("Hair Trimming View")
            .font(.largeTitle)
    }
}

struct tawaf: View {
    var body: some View {
        Text("Tawaf View")
            .font(.largeTitle)
    }
}
}
extension Color {
    init(customHex: String) { // Change the name to avoid conflict
        var hexSanitized = customHex.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Remove the "#" if it exists
        if hexSanitized.hasPrefix("#") {
            hexSanitized.removeFirst()
        }
        
        var int: UInt64 = 0
        if Scanner(string: hexSanitized).scanHexInt64(&int) {
            let a, r, g, b: UInt64
            switch hexSanitized.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
            }
            
            self.init(
                .sRGB,
                red: Double(r) / 255,
                green: Double(g) / 255,
                blue: Double(b) / 255,
                opacity: Double(a) / 255
            )
        } else {
            self.init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0)
        }
    }
}

struct SaiView_Previews: PreviewProvider {
    static var previews: some View {
        SaiView()
    }
}



