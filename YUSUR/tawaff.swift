import SwiftUI
import _SwiftData_SwiftUI

struct TawafView: View {
    @State private var currentRound: Int = 0 // Current number of rounds
    @State private var isCompleted: Bool = false // To check if the counter has completed
    @State private var selectedIndex = 0 // Track selected dua in the TabView
    
    let progressSteps = ["Ihram", "Tawaf", "Sa'i", "Hair Trimming"] // List of steps with new order
    let duas = [
        "Our Lord, give us good in this world and good in the Hereafter, and protect us from the punishment of the Fire",
        "Glory be to Allah, all praise is due to Allah, there is no god but Allah, and Allah is the Greatest",
        "O Allah, You are Pardoning and Generous, and You love to pardon, so pardon me",
        "O Allah, I ask You for pardon and well-being in this world and the Hereafter"
    ]
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Top title and line
                VStack {
                    // Title
                    HStack {
                        Image("kaaba") // Placeholder for Umrah Guide Icon
                            .resizable().frame(width: 35, height: 35 )
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                        
                        Text("Umrah Guide")
                            .font(.custom("Amiri-Bold", size: 32))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    // Line below the title
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 2)
                        .padding(.horizontal, 1) // Line extension
                        .padding(.bottom, 16) // Spacing below the line
                }
                
                // Steps bar with connecting line
                HStack(spacing: 0) { // Set spacing to 0 for seamless connections
                    ForEach(progressSteps.indices, id: \.self) { index in
                        HStack(spacing: 0) { // Adjust spacing within each step and line group
                            // Step Block
                            Text(progressSteps[index])
                                .font(.custom("Amiri-Bold", size: 12))
                                .foregroundColor(index == 0 || index == 1 ? .white : .black) // Set "Ihram" and "Tawaf" to white text
                                .frame(width: 64, height: 41)
                                .background(index == 0 || index == 1 ? Color(hex: "#79634B") : (index == 2 || index == 3 ? Color(hex: "#E6D9CA") : Color.gray.opacity(0.3))) // Background color based on index
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
                .padding(.horizontal) // Add space on the left and right sides
                .padding(.top) // Adds padding on the top
                
                // Tawaf Description
                ScrollView {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Tawaf:")
                            .font(.custom("Amiri-Regular", size: 16))
                        Text("""
                        Begin Tawaf at the Black Stone.\n
                        Say "Bismillah, Allahu Akbar".\n
                        If you can touch the Black Stone, do so. If not, gesture towards it while continuing Tawaf. Continue with prayers and supplications.
                        """)
                        .font(.body)
                        .lineSpacing(2)
                    }
                    .padding(.horizontal, 18) // Adds extra spacing on the sides
                    .padding(.top, 18) // Raises the text a bit above
                    
                    // Round Counter
                    VStack {
                        ZStack {
                            Circle()
                                .fill(Color(hex: "#79634B")) // Use the new brown color
                                .frame(width: 150, height: 150) // Enlarges the circle
                                .onTapGesture {
                                    // Increase counter only if less than 7
                                    if currentRound < 7 {
                                        currentRound += 1
                                    }
                                    if currentRound == 7 {
                                        isCompleted = true
                                    }
                                }
                            // Display number or "+" if counter is at zero
                            Text(currentRound == 0 ? "+" : "\(currentRound)")
                                .font(.system(size: 48))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding(.top, 40) // Raises the counter slightly
                        
                        // Display message based on the current round count
                        Text(currentRound == 0 ? "Start Round" : (currentRound == 7 ? "Tawaf Completed!" : ""))
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
                                        .padding(.bottom,40)
                                    
                                    Spacer()
                                }
                                .tag(index)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.white) // Optional: Add background color
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Custom dots
                        .frame(height: 200)
                        
                        // Custom Dots
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
                    
                    Spacer() // Push buttons to the bottom
                    
                    Spacer() // Push buttons to the bottom
                }
                    // Bottom Buttons
                    HStack {
                        NavigationLink(destination: IhramView()) { // Navigate to SaiView on Back
                            Text("Back")
                                .frame(width: 100, height: 4)
                                .padding()
                                .background(Color(hex: "#79634B")) // Change to brown
                                .foregroundColor(.white) // White text color
                                .cornerRadius(100)
                                .font(.custom("Amiri-Bold", size: 18))
                            
                        }
                        Spacer()
                        
                        NavigationLink(destination: SaiView()) { // Navigate to Sai on Continue
                            Text("Continue")
                                .frame(width: 100, height: 4)
                                .padding()
                                .background(isCompleted ? Color(hex: "#79634B") : Color.gray.opacity(0.5)) // Use the new brown color
                                .foregroundColor(.white)
                                .cornerRadius(100)
                                .font(.custom("Amiri-Bold", size: 18))
                            
                        }
                        .disabled(!isCompleted) // Disable Continue button if counter isn't completed
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 16) // Space with Safe Area
                }
                .navigationBarBackButtonHidden(true) // إخفاء زر الرجوع الافتراضي
            }
        }
    }

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
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
    }
}

struct TawafView_Previews: PreviewProvider {
    static var previews: some View {
        TawafView()
    }
}
