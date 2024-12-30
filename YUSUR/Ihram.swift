import Foundation
import SwiftUI

struct IhramView: View {
    @State private var selectedGender: String = "Men" // Default is Men
    let progressSteps = ["Ihram", "Tawaf", "Sa’i", "Hair Trimming"] // Non-clickable steps
    
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
                        Text("**Intention (Niyyah):**")
                            .font(.headline)
                        Text("""
                            At the designated Miqat (entry point for Ihram), declare the intention for Umrah by saying:
                            
                            \"Labbayk Allahumma Umrah\" (Here I am, O Allah, for Umrah).
                            """)
                        Text("It is sufficient to make the intention in your heart without verbal declaration.")
                        
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
                        
                        // Arabic Prayer
                        Text("""
                        اللَّهُمَّ إِنِّي أَسْأَلُكَ الجَنَّةَ، وَمَا قَرَّبَ إِلَيْهَا مِنْ قَوْلٍ وَعَمَلٍ، وَأَعُوذُ بِكَ مِنَ النَّارِ، وَمَا قَرَّبَ إِلَيْهَا مِنْ قَوْلٍ وَعَمَلٍ.
                        """)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        
                        Text("Oh God, I ask you for Paradise, and whatever words and deeds bring me closer to it, and I seek refuge in You from Hell, and whatever words and deeds bring me closer to it.")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    
                    
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
                    .padding(.top,120)
                    .padding()
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

