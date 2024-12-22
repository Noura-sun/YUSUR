import SwiftUI

struct TawafView: View {
    @State private var currentRound: Int = 0 // Current number of rounds
    @State private var isCompleted: Bool = false // To check if the counter has completed
    
    let progressSteps = ["Ihram", "Tawaf", "Sa'i", "Hair Trimming"] // List of steps with new order
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Top title and line
                VStack {
                    Text("Umrah Guide")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 16) // Space with Safe Area
                        .padding(.bottom, 8) // Space between title and line
                    
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
                                .font(.footnote)
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
                VStack(alignment: .leading, spacing: 4) {
                    Text("Tawaf:")
                        .font(.headline)
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
                                
                                // Check if counter has completed
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
                }
                
                Spacer() // Push buttons to the bottom
                
                // Bottom Buttons
                HStack {
                    NavigationLink(destination: EndIhram()) { // Navigate to SaiView on Back
                        Text("Back")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8) // Smaller vertical padding
                            .padding(.horizontal, 24) // Slightly larger horizontal padding for consistency
                            .background(Color(hex: "#79634B")) // Change to brown
                            .foregroundColor(.white) // White text color
                            .cornerRadius(8)
                    }
                    
                    NavigationLink(destination: Sai()) { // Navigate to EndIhramView on Continue
                        Text("Continue")
                        
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8) // Smaller vertical padding
                            .padding(.horizontal, 24) // Slightly larger horizontal padding for consistency
                            .background(isCompleted ? Color(hex: "#79634B") : Color.gray.opacity(0.5)) // Use the new brown color
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .disabled(!isCompleted) // Disable Continue button if counter isn't completed
                            .navigationBarBackButtonHidden(true)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 16) // Space with Safe Area
            }
            .edgesIgnoringSafeArea(.bottom) // Ignore Safe Area only at the bottom
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
