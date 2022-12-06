//
//  CustomDateFormatter.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 6.12.22.
//

import Foundation

final class CustomDateFormatter {
    static func getCurrentDate() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dateFormatter.string(from: currentDate)
        return dateString
    }
}
