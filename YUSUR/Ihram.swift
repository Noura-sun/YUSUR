import SwiftUI

struct IhramView: View {
    @State private var showHelpModal: Bool = false // State to show or hide the help modal
    @State private var selectedGender: String = "Men" // Default is Men
    @State private var selectedIndex: Int = 0 // For tracking the current dua index

    let progressSteps = ["Ihram", "Tawaf", "Sa’i", "End Ihram"] // Non-clickable steps
    let duas = [
        "Our Lord, give us good in this world and good in the Hereafter, and protect us from the punishment of the Fire",
        "Glory be to Allah, all praise is due to Allah, and Allah is the Greatest",
        "O Allah, You are Pardoning and Generous, and You love to pardon, so pardon me",
        "O Allah, I ask You for pardon and well-being in this world and the Hereafter"
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    // Question mark button at the top
                    HStack {
                        Button(action: {
                            showHelpModal = true // Show the help modal
                        }) {
                            Image(systemName: "questionmark.circle")
                                .font(.title2)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading)
                        Spacer()
                    }
                    .padding(.top, 20)
                    
                    // Progress Bar (Non-clickable)
                    HStack(spacing: 0) {
                        ForEach(progressSteps.indices, id: \.self) { index in
                            HStack(spacing: 0) {
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
                    .padding(.horizontal)
                    .padding(.top)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 12) {
                            // Section: Intention (Niyyah)
                            Text("Intention (Niyyah)")
                                .font(.custom("Amiri-Regular", size: 20))
                                .padding(.bottom, 12)
                                .padding(.top, 12)
                            Text("""
                            At the designated Miqat (entry point for Ihram), declare the intention for Umrah by saying:

                            \"Labbayk Allahumma Umrah\" (Here I am, O Allah, for Umrah).

                            It is sufficient to make the intention in your heart without verbal declaration.
                            """)
                            .font(.custom("Amiri-Regular", size: 16))

                            Spacer().frame(height: 20)
                            
                            // Gender Picker and Rules Box
                            VStack(alignment: .leading, spacing: 8) {
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
                                
                                Text(selectedGender == "Men" ?
                                     "Wear two white, unstitched garments (Izar and Rida)." :
                                     "Women should wear modest clothing that covers the body but does not include the face and hands.")
                                .font(.body)
                                .padding(.top, 4)
                            }
                            .padding()
                            .background(Color.brown.opacity(0.2))
                            .cornerRadius(8)
                        }
                        .padding()
                        
                        // Dua Section
                        VStack {
                            TabView(selection: $selectedIndex) {
                                ForEach(0..<duas.count, id: \.self) { index in
                                    VStack {
                                        Text(duas[index])
                                            .font(.custom("Amiri-Regular", size: 17))
                                            .multilineTextAlignment(.center)
                                            .padding(.top, -40)
                                    }
                                    .tag(index)
                                    .padding()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.white)
                                }
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            .frame(height: 180)
                            
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
                            .padding(.top, -60)
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
                        .padding(.horizontal, 20)
                        .padding(.top, -49)
                    }
                    .navigationBarBackButtonHidden(true)
                }
                
                // Modal with blurred background
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



struct IhramView_Previews: PreviewProvider {
    static var previews: some View {
        IhramView()
    }
}
