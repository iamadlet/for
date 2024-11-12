//
//  OneMinuteBlock.swift
//  Berlin Clock App
//
//  Created by Адлет Жумагалиев on 05.11.2024.
//

import SwiftUI

struct OneMinuteBlock: View {
    var berlin: [Character] = []
    var body: some View {
        HStack {
            ForEach((20..<24)) {i in
                Rectangle()
                    .frame(width: 74, height: 32)
                    .cornerRadius(4)
                    .foregroundColor(berlin[i] == "Y" ? .yellowOn : .yellowOff)
            }
        }
    }
}



#Preview {
    OneMinuteBlock()
}
