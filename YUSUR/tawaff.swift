import SwiftUI

struct TawafView: View {
    @State private var currentRound: Int = 0 // Current number of rounds
    @State private var isCompleted: Bool = false // To check if the counter has completed
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Top title
                VStack {
                    Text("Umrah Guide")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 16) // Space with Safe Area
                        .padding(.bottom, 8)
                    
                    // Line below the title
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 2)
                        .padding(.horizontal, 1) // Line extension
                        .padding(.bottom, 16) // Spacing below the line
                    
                    // Steps bar with connecting line
                    ZStack {
                        // Line between steps
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 2)
                            .padding(.horizontal, 40) // Control line width
                            .zIndex(0) // Ensure line stays in the background
                        
                        // Steps
                        HStack(spacing: 20) {
                            StepView(stepName: "Ihram", isActive: true)
                            StepView(stepName: "Tawaf", isActive: true)
                            StepView(stepName: "Sa’i", isActive: false)
                            StepView(stepName: "Hair Trimming", isActive: false)
                        }
                        .zIndex(1) // Ensure steps always appear in front
                    }
                    .padding(.horizontal)
                    .frame(height: 60) // Ensures alignment of elements
                }
                                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Tawaf:")
                        .font(.headline)
                    Text("""
                        Begin Tawaf at the Black Stone.\n
                        Say \"Bismillah, Allahu Akbar\".\n
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
                            .fill(Color.brown)
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
                    Button("Back") {
                        // Action for Back
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    
                    Button("Continue") {
                        // Action for Continue
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isCompleted ? Color.brown : Color.gray.opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .disabled(!isCompleted) // Disable Continue button if counter isn't completed
                }
                .padding(.horizontal)
                .padding(.bottom, 16) // Space with Safe Area
            }
            .edgesIgnoringSafeArea(.bottom) // Ignore Safe Area only at the bottom
        }
    }
}

struct StepView: View {
    var stepName: String
    var isActive: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(stepName == "Tawaf" ? Color.brown : stepName == "Sa’i" ? Color.gray.opacity(0.3) : (isActive ? Color.brown : Color.gray.opacity(0.3)))
                .frame(width: 80, height: 40) // Uniform size for all steps
                .cornerRadius(8) // Rounded corners
            Text(stepName)
                .font(.footnote)
                .foregroundColor(.white)
        }
        .zIndex(isActive ? 1 : 0) // Control ZIndex based on active step
    }
}

struct TawafView_Previews: PreviewProvider {
    static var previews: some View {
        TawafView()
    }
}
