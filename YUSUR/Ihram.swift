import Foundation
import SwiftUI

struct UmrahGuideView: View {
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
                
                
                Divider()// the line
                    .frame(height: 1) // Thickness of the line
                    .background(Color.gray.opacity(0.5))
                    .padding(.horizontal) // Add padding to match the layout
                
                // Progress Bar (Non-clickable)
               
                HStack(spacing: 0) { // Set spacing to 0 for seamless connections
                    ForEach(progressSteps.indices, id: \.self) { index in
                        HStack(spacing: 0) { // Adjust spacing within each step and line group
                            // Step Block
                            Text(progressSteps[index])
                                .font(.footnote)
                                .foregroundColor(index == 0 ? .white : .black)
                                .frame(width: 64, height: 41)
                                .background(index == 0 ? Color.brown : Color.gray.opacity(0.3))
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
                                .frame(width: 160, height: 50 )
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
                }
                
                // Bottom Buttons
                HStack {
                    Button(action: {
                        print("Back pressed")
                    }) {
                        Text("Back")
                            .frame(width: 100, height: 4)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(100)
                        Spacer()
                    }
                    
                    .foregroundColor(.black)
                    
                    Button(action: {
                        print("Continue pressed")
                    }) {
                        Text("Continue")
                            .frame(width: 100, height: 4)
                            .padding()
                            .background(Color.brown)
                            .foregroundColor(.white)
                            .cornerRadius(100)
                    }
                }
                .padding()
            }
        }
    }
}

struct UmrahGuideView_Previews: PreviewProvider {
    static var previews: some View {
        UmrahGuideView()
    }
}

