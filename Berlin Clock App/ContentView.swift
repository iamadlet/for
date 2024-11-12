//
//  ContentView.swift
//  Berlin Clock App
//
//  Created by Адлет Жумагалиев on 05.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var timePicker = Date()
    @State private var berlinDate: [Character] = []
    @State private var normalClock = ""
    
    func showTime() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
            _ in
            let calendar = Calendar.current
            var seconds = calendar.component(.second, from: .now)
            var minutes = calendar.component(.minute, from: timePicker)
            var hours = calendar.component(.hour, from: timePicker)
                
            seconds += 1
            
            if seconds == 60 {
                seconds = 0
                minutes += 1
            }
            if minutes == 60 {
                minutes = 0
                hours += 1
            }
            if hours == 24 {
                hours = 0
            }
            if let newDate = Calendar.current.date(bySettingHour: hours, minute: minutes, second: seconds, of: timePicker) {
                timePicker = newDate
            }
               
            
            let berlinClock = BerlinClock()
            normalClock = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
            berlinDate = berlinClock.berlinClock(hour: hours, minute: minutes, second: seconds)
                .map { Character(extendedGraphemeClusterLiteral: $0) }
            print("text text \(berlinDate)")
        })
        .fire()
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.bgColor.ignoresSafeArea()
            
            VStack {
                Text("Time is \(normalClock)")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .padding(.top, 2)
                ZStack(alignment: .top) {
                    Rectangle()
                        .frame(width: 358, height: 312)
                        .cornerRadius(16)
                        .foregroundColor(.white)
                    VStack(spacing: 16) {
                        if (berlinDate.count > 0) {
                            SecondsBlock(berlin: berlinDate)
                                .padding(.top, 24)
                            FiveHourBlock(berlin: berlinDate)
                            OneHourBlock(berlin: berlinDate)
                            FiveMinuteBlock(berlin: berlinDate)
                            OneMinuteBlock(berlin: berlinDate)
                        }
                    }
                    .padding(.horizontal, 16)
                }
                ZStack(alignment: .center) {
                    Rectangle()
                        .frame(width: 358, height: 54)
                        .cornerRadius(16)
                        .foregroundColor(.white)
                    HStack {
                        DatePicker("Insert time", selection: $timePicker, displayedComponents: .hourAndMinute)
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .onChange(of: timePicker) { newValue in
                                timePicker = newValue
                            }
                    }
                    .padding(.horizontal, 32)
                }
            }
        }
        .onAppear {
            showTime()
        }
    }
}

extension Color {
    static let bgColor = Color(red: 242/255, green: 242/255, blue: 238/255)
    static let yellowOn = Color(red: 255/255, green: 204/255, blue: 0/255)
    static let yellowOff = Color(red: 255/255, green: 204/255, blue: 102/255)
    static let redOn = Color(red: 255/255, green: 59/255, blue: 48/255)
    static let redOff = Color(red: 255/255, green: 137/255, blue: 131/255)
}



#Preview {
    ContentView()
}
