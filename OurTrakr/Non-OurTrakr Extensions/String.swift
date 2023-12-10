//
//  String.swift
//  OurTrakr
//
//  Created by Ben Roberts on 12/10/23.
//

import Foundation

extension String {
    var isNumber: Bool {
        return self.range(
            of: "^-?\\d*\\.?\\d+$",
            options: .regularExpression
        ) != nil && !self.isEmpty
    }
}
