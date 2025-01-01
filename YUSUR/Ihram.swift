import Foundation
import SwiftUI

struct IhramView: View {
    @State private var selectedGender: String = "Men" // Default is Men
    @State private var selectedIndex: Int = 0 // For tracking the current dua index
    let progressSteps = ["Ihram", "Tawaf", "Sa’i", "EndIhram"] // Non-clickable steps
    
    let duas = [
        "Our Lord, give us good in this world and good in the Hereafter, and protect us from the punishment of the Fire",
        "Glory be to Allah, all praise is due to Allah, and Allah is the Greatest",
        "O Allah, You are Pardoning and Generous, and You love to pardon, so pardon me",
        "O Allah, I ask You for pardon and well-being in this world and the Hereafter"
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                // Progress Bar (Non-clickable)
                HStack(spacing: 0) { // Set spacing to 0 for seamless connections
                    ForEach(progressSteps.indices, id: \.self) { index in
                        HStack(spacing: 0) { // Adjust spacing within each step and line group
                            // Step Block
                            Text(progressSteps[index])
                                .font(.footnote)
                                .foregroundColor(index == 0 ? .white : .black)
                                .frame(width: 64, height: 41)
                                .background(index == 0 ? Color("Color 1") : Color("Color 2"))
                                .cornerRadius(6)
                            
                            // Connecting Line (only if not the last step)
                            if index < progressSteps.count - 1 {
                                Rectangle()
                                    .frame(height: 2) // Line thickness
                                    .foregroundColor(Color("Color 2"))
                            }
                        }
                    }
                }
                .padding(.horizontal) // Give space in first and last step
                .padding(.top)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        // Section: Intention (Niyyah)
                        Text("Intention (Niyyah)")
                            .font(.custom("Amiri-Regular", size: 20))
                            .padding(.bottom, 12) // Add space below "Tawaf"
                            .padding(.top, 12) // Add space below "Tawaf"
                        Text("""
                        At the designated Miqat (entry point for Ihram), declare the intention for Umrah by saying:

                        \"Labbayk Allahumma Umrah\" (Here I am, O Allah, for Umrah).

                        It is sufficient to make the intention in your heart without verbal declaration.
                        """)
                        .font(.custom("Amiri-Regular", size: 16)) // Apply the same font style

                        
                        // Add some space before the box
                        Spacer().frame(height: 20)
                        
                        // Gender Picker and Rules Box
                        VStack(alignment: .leading, spacing: 8) {
                            // Title and Picker in a Horizontal Stack
                            HStack {
                                Text("Rules of Ihram")
                                    .font(.headline)
                                Spacer()
                                Picker(selection: $selectedGender, label: Text("")) {
                                    Text("Women").tag("Women")
                                    Text("Men").tag("Men")
                                }
                                .pickerStyle(SegmentedPickerStyle())
                                .frame(width: 160, height: 50)
                            }
                            
                            // Rules Text
                            Text(selectedGender == "Men" ?
                                 "Wear two white, unstitched garments (Izar and Rida)." :
                                    "Women should wear modest clothing that covers the body but does not include the face and hands.")
                            .font(.body)
                            .padding(.top, 4)
                        }
                        .padding()
                        .background(Color.brown.opacity(0.2)) // Box background color
                        .cornerRadius(8)
                    }
                    .padding()
                    
                    // Dua Section
                    VStack {
                        TabView(selection: $selectedIndex) {
                            ForEach(0..<duas.count, id: \.self) { index in
                                VStack {
                                    Text(duas[index])
                                        .font(.custom("Amiri-Regular", size: 17)) // Adjust font size and style here
                                        .multilineTextAlignment(.center)
                                        .padding(.top,-40)

                                }
                                .tag(index)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.white) // Optional: Add background color
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Custom dots
                        .frame(height: 180) // Adjusted height for tighter layout
                        
                        // Custom Dots
                        HStack(spacing: 8) {
                            ForEach(0..<duas.count, id: \.self) { index in
                                Circle()
                                    .fill(selectedIndex == index ? Color.gray : Color.secondary.opacity(0.4))
                                    .frame(width: 6, height: 10)
                                    .onTapGesture {
                                        withAnimation {
                                            selectedIndex = index
                                        }
                                    }
                            }
                        }
                        .padding(.top, -60) // Adjust spacing between duas and dots
                        .padding(.bottom)
                    }
                    .padding()
                    Spacer()
                    // Bottom Navigation Button
                    HStack {
                        Spacer()
                        NavigationLink(destination: TawafView()) {
                            Text("Continue")
                                .frame(width: 100, height: 4)
                                .padding()
                                .background(Color("Color 1"))
                                .foregroundColor(.white)
                                .cornerRadius(100)
                        }
                    }
                    .padding(.horizontal,20)
                    .padding(.top,-30)
                }
                .navigationBarBackButtonHidden(true) // Hide the back button
            }
        }
    }
}

// Example of the next page
struct Ihram: View {
    var body: some View {
        VStack {
            Text("Tawaf Page")
                .font(.largeTitle)
                .padding()
            
            Text("This is where the Tawaf content will go.")
                .font(.body)
                .padding()
        }
    }
}

struct Ihram_Previews: PreviewProvider {
    static var previews: some View {
        IhramView()
    }
}
