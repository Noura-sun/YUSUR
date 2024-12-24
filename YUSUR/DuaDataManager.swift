//
//  DuaDataManager.swift
//  YUSUR
//
//  Created by shaden  on 13/06/1446 AH.
//
import SwiftData

@MainActor
class DuaDataManager {
    static func seedDuaDataIfNeeded(context: ModelContext) {
        let existingDuas = try? context.fetch(FetchDescriptor<Dua>())
               if let existingDuas = existingDuas, !existingDuas.isEmpty {
                   return // إذا كانت البيانات موجودة، لا تقم بإعادة إضافتها
               }
               
            let initialDuas = [
                // الإحرام
                Dua(arabicText: "لبيك اللهم لبيك، لبيك لا شريك لك لبيك، إن الحمد والنعمة لك والملك، لا شريك لك.", category: "الإحرام"),
                
                // الطواف
                Dua(arabicText: "يختم كل شوط بقوله: رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ", category: "الطواف"),
                Dua(arabicText: "سبحان الله والحمد لله ولا إله إلا الله والله أكبر.", category: "الطواف"),
                Dua(arabicText: "اللهم إنك عفو كريم تحب العفو فاعف عني.", category: "الطواف"),
                Dua(arabicText: "اللهم إني أسألك العفو والعافية في الدنيا والآخرة.", category: "الطواف"),
                
                // السعي
                Dua(arabicText: "الله أكبر، الله أكبر، الله أكبر، لا إله إلا الله وحده لا شريك له، له الملك وله الحمد، وهو على كل شيء قدير، لا إله إلا الله وحده، أنجز وعده، ونصر عبده، وهزم الأحزاب وحده.", category: "السعي"),
                Dua(arabicText: "اللهم إنك عفوٌ كريمٌ تحب العفو فاعفُ عني.", category: "السعي"),
                Dua(arabicText: "لا إله إلا الله، وحده لا شريك له، له الملك، وله الحمد، يحيي ويميت وهو على كل شيء قدير، لا إله إلا الله وحده أنجز وعده، ونصر عبده، وهزم الأحزاب وحده.", category: "السعي"),
                Dua(arabicText: "للَّهُمَّ أنْتَ رَبِّي لا إلَهَ إلَّا أنْتَ، خَلَقْتَنِي وأنا عَبْدُكَ، وأنا علَى عَهْدِكَ ووَعْدِكَ ما اسْتَطَعْتُ، أعُوذُ بكَ مِن شَرِّ ما صَنَعْتُ، أبُوءُ لكَ بنِعْمَتِكَ عَلَيَّ، وأَبُوءُ لكَ بذَنْبِي فاغْفِرْ لِي، فإنَّه لا يَغْفِرُ الذُّنُوبَ إلَّا أنْتَ.", category: "السعي"),
                
                // التحلل من الإحرام
                // التحلل من الإحرام
                Dua(arabicText: "O Allah, make me among those accepted in this world and the Hereafter. Forgive me, my parents, and all Muslims.", category: "Exiting Ihram"),
                Dua(arabicText: "O Allah, grant me the opportunity to visit Your Sacred House again. Bless my life and guide me to what You love and are pleased with.", category: "Exiting Ihram"),
                Dua(arabicText: "O Allah, to You belongs all praise for the completion of blessings and the perfection of Your grace. O Allah, make me among those You are pleased with, forgive them, and have written for them the full reward of Umrah.", category: "Exiting Ihram"),
                Dua(arabicText: "O Allah, to You belongs all praise. You have beautified my creation and adorned my hair. Make it a source of purity and blessing for me. Forgive my sins and accept my worship.", category: "Exiting Ihram")
                ]
            
            for dua in initialDuas {
                context.insert(dua) // Add each Dua to the context
            }
            
            try? context.save() // Save the data
        }
    }

