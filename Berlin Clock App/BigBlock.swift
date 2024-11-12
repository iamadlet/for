//
//  BigBlock.swift
//  Berlin Clock App
//
//  Created by Адлет Жумагалиев on 10.11.2024.
//

import SwiftUI

struct BigBlock: View {
    var berlinClock: String = ""
    var hours: Int = 1
    var body: some View {
//        ForEach(1...4) {i in
            Rectangle()
                .frame(width: 74, height: 32)
                .cornerRadius(4)
//                .foregroundColor(
//                    hours % 2 == 0 ? .redOn : .redOff
//                )
//        }
    }
}

#Preview {
    BigBlock()
}
