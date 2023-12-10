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
            of: "^[0-9]*$",
            options: .regularExpression) != nil
    }
}
