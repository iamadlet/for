//
//  FiveMinuteBlock.swift
//  Berlin Clock App
//
//  Created by Адлет Жумагалиев on 05.11.2024.
//

import SwiftUI

struct FiveMinuteBlock: View {
    var berlin: [Character] = []
    var body: some View {
        HStack {
            ForEach((9..<20))
                {i in
                    Rectangle()
                        .frame(width: 20, height: 32)
                        .cornerRadius(4)
                        .foregroundColor(decideFiveMinuteColor(index: berlin[i], number: i - 8))
                }
        }
    }
}

func decideFiveMinuteColor(index: Character, number: Int) -> Color {
    var colorOfTheBlock: Color
    if index == "R" {
        colorOfTheBlock = Color.redOn
    } else if index == "Y" {
        colorOfTheBlock = Color.yellowOn
    } else if index == "O" && number % 3 == 0 {
        colorOfTheBlock = Color.redOff
    } else {
        colorOfTheBlock = Color.yellowOff
    }
    
    return colorOfTheBlock
}

#Preview {
    FiveMinuteBlock()
}
