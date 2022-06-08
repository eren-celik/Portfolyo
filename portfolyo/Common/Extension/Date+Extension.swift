//
//  Date+Extension.swift
//  portfolyo
//
//  Created by Eren  Çelik on 8.06.2022.
//

import Foundation

extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
