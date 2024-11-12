//
//  BerlinClockLogic.swift
//  Berlin Clock App
//
//  Created by Адлет Жумагалиев on 06.11.2024.
//

import SwiftUI

struct BerlinClock {
    func berlinClock(hour: Int, minute: Int, second: Int) -> [Character] {
        var berlinArray: [Character] = []
        //Seconds lamp
        if second % 2 == 0 {
            berlinArray.append("Y")
        } else {
            berlinArray.append("O")
        }
        
        //Five Hours lamps
        let fiveHourOnLampsCount: Int = hour / 5
        var remainder: Int = 4 - fiveHourOnLampsCount
        for _ in 1...fiveHourOnLampsCount {
            berlinArray.append("R")
        }
        for _ in 1...remainder {
            berlinArray.append("O")
        }
        
        //Single Hours Lamps
        let singleHourOnLampsCount: Int = hour % 5
        remainder = 4 - singleHourOnLampsCount
        for _ in 1...singleHourOnLampsCount {
            berlinArray.append("R")
        }
        for _ in 1...remainder {
            berlinArray.append("O")
        }
        
        //Five Minutes lamp
        let fiveMinutesOnLampsCount: Int = minute / 5
        for i in 1...fiveMinutesOnLampsCount{
            if i % 3 == 0 {
                berlinArray.append("R")
            } else {
                berlinArray.append("Y")
            }
        }
        if fiveMinutesOnLampsCount < 11 {
            remainder = 11 - fiveMinutesOnLampsCount
            for _ in 1...remainder {
                berlinArray.append("O")
            }
        }
        
        //SIngle Minutes lamp
        let singleMinutesOnLampsCount: Int = minute % 5
        for _ in 1...singleMinutesOnLampsCount {
            berlinArray.append("Y")
        }
        remainder = 4 - singleMinutesOnLampsCount
        for _ in 1...remainder {
            berlinArray.append("O")
        }
        
        return berlinArray
    }

}

