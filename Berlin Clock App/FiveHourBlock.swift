//
//  FiveHourBlock.swift
//  Berlin Clock App
//
//  Created by Адлет Жумагалиев on 05.11.2024.
//

import SwiftUI

struct FiveHourBlock: View {
    var berlin: [Character] = []
    var body: some View {
        HStack {
            ForEach((1..<5)) {i in
                Rectangle()
                    .frame(width: 74, height: 32)
                    .cornerRadius(4)
                    .foregroundColor(berlin[i] == "R" ?
                        .redOn : .redOff)
            }
        }
    }
}

#Preview {
    FiveHourBlock()
}
