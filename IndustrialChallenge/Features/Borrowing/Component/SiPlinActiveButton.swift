//
//  SiPlinActiveButton.swift
//  IndustrialChallenge
//
//  Created by Amanda on 28/07/25.
//


import SwiftUI
import SwiftData

struct SiPlinActiveButton : View{
    @Environment(\.modelContext) private var modelContext

    @Binding var rekomendasiPinjaman: String
    @Binding var showSiPlinModal: Bool
    @Binding var siPlinRecommendation: Bool
    @Binding var currSiPlinStep: SiPlinStep

    var body: some View{
        HStack(spacing: 0){
            Image("rounded-siplin").resizable().frame(width: 65, height: 55)
            VStack(alignment: .leading, spacing: 4){
                Text("Rekomendasi Pinjaman oleh SiPlin")
                    .font(.system(size: 13))
                    .foregroundStyle(Color.black).fontWeight(.semibold)
               (
                Text("Rp\(rekomendasiPinjaman)").fontWeight(.semibold).foregroundStyle(Color.black)
               ).font(.system(size: 14))
                
                HStack{
                    Button {
                        currSiPlinStep = .siPlinBorrowing
                        showSiPlinModal = true
                        siPlinRecommendation = false

                        Task {
                            do {
                                let fetchDescriptor = FetchDescriptor<BorrowingLoanRequest>()
                                let allRecords = try modelContext.fetch(fetchDescriptor)
                                for record in allRecords {
                                    modelContext.delete(record)
                                }
                                try modelContext.save()
                                print("✅ All BorrowingLoanRequest records deleted.")
                            } catch {
                                print("❌ Failed to delete records: \(error)")
                            }
                        }

                    } label: {
                        Text("Ulang Rekomendasi")
                            .foregroundStyle(Color("DarkGreen"))
                            .underline()
                            .font(.system(size: 12))
                    }

                    Spacer()
                    
                    Button{
                        currSiPlinStep = .siPlinRecommendation
                        showSiPlinModal = true
                    }label: {
                        Text("Lihat Opsi").foregroundStyle(Color.black).fontWeight(.semibold)
                            .font(.system(size: 12))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.white)
                                )
                        
                    }
                }
            }
            
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(
                   LinearGradient(
                       gradient: Gradient(colors: [
                           Color(red: 213/255, green: 243/255, blue: 219/255),
                           Color(red: 233/255, green: 249/255, blue: 236/255)
                       ]),
                       startPoint: .leading,
                       endPoint: .trailing
                   )
                   .cornerRadius(16)
                   
               )
            .padding(.horizontal, 12)
    }
    
}
