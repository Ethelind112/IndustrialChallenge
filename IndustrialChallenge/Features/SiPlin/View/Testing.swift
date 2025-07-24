//
//  Testing.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import SwiftUI

struct Testing: View {
    @State var show: Bool = false
    
    var body: some View {
        Button {
            show = true
        }label: {
            Text("SiPlin")
        }
        .sheet(isPresented: $show) {
            SiPlinView(income: "3000000", borrowed: "9000000")
        }
    }
}

#Preview {
    Testing()
}
