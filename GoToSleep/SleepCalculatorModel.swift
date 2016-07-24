//
//  SleepCalculatorModel.swift
//  GoToSleep
//
//  Created by Pivotal on 5/22/16.
//  Copyright © 2016 sidho. All rights reserved.
//

import Foundation

class SleepCalculatorModel {
    let intervals = 6
    let sleepCycleMinutes = 90
    
    func calculateSleepTimes (wakeTime: NSDate, fallAsleepTime: Float) -> [Int: NSDate] {
        var sleepTimes = Dictionary<Int, NSDate>()
        for i in 1...6 {
            let calculatedSleepTime = calculateSleepTime(wakeTime, fallAsleepTime: fallAsleepTime, interval: i)
            sleepTimes[i] = calculatedSleepTime
        }
        
        return sleepTimes
    }
    
    private func calculateSleepTime(wakeTime: NSDate, fallAsleepTime: Float, interval: Int) -> NSDate {
        let sleepCycleSeconds = sleepCycleMinutes * 60
        let fallAsleepTimeSeconds = fallAsleepTime * 60
        let timeDifference = Double(sleepCycleSeconds * interval) + Double(fallAsleepTimeSeconds)
        
        return wakeTime.dateByAddingTimeInterval(timeDifference * -1.0)
    }
}
