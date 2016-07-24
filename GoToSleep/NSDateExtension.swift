//
//  NSDateExtension.swift
//  GoToSleep
//
//  Created by Pivotal on 5/22/16.
//  Copyright © 2016 sidho. All rights reserved.
//

import Foundation

extension NSDate
{
    func toTimeString() -> String
    {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let timeString = formatter.stringFromDate(self)
        
        return timeString
    }
}