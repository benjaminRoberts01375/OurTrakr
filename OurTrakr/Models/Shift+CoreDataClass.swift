//
//  Shift+CoreDataClass.swift
//  
//
//  Created by Ben Roberts on 12/10/23.
//
//

import CoreData
import Foundation

@objc(Shift)
public class Shift: NSManagedObject, Identifiable {
    var duration: TimeInterval {
        let fullDuration = end?.timeIntervalSince(start ?? Date()) ?? 0
        return TimeInterval(Int(fullDuration / 60) * 60)
    }
    
    var formattedDuration: String {
        let interval = duration
        let hours = interval / 3600
        let roundedHours = hours.rounded(.down)
        let minutes = interval / 60 - roundedHours * 60
        let roundedMinutes = Int(minutes.rounded(.down))
        
        var output = ""
        if hours > 1 && hours < 2 {
            output = "1 hour"
        }
        else if hours >= 2 {
            output = "\(Int(roundedHours)) hours"
        }
        if roundedMinutes == 1 {
            output += " 1 minute"
        }
        else if roundedMinutes > 1 {
            output += " \(roundedMinutes) minutes"
        }
        else if minutes < 1 && roundedHours == 0 {
            output = " <1 minute"
        }
        
        return output
    }
}
