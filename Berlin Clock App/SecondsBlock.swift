//
//  SecondsBlock.swift
//  Berlin Clock App
//
//  Created by Адлет Жумагалиев on 05.11.2024.
//

import SwiftUI

struct SecondsBlock: View {
    var berlin: [Character] = []
    var body: some View {
        Circle()
            .frame(width: 56, height: 56)
            .foregroundColor(
                berlin[0] == "Y" ? .yellowOn : .yellowOff
            )
    }
}

#Preview {
    SecondsBlock()
}
