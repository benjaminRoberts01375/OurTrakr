//
//  Date.swift
//  OurTrakr
//
//  Created by Ben Roberts on 12/10/23.
//

import SwiftUI

extension Date {
    var dateSlash: String {
        let dateFormat: DateFormatter = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yyyy"
        return dateFormat.string(from: self)
    }
    
    var isToday: Bool {
        let cal = Calendar.current
        return cal.isDateInToday(self)
    }
    
    var isYesterday: Bool {
        let cal = Calendar.current
        return cal.isDateInYesterday(self)
    }
}
