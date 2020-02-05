//
//  RelativeDates.swift
//  RelativeDatesInSwiftUI
//
//  Created by ramil on 05.02.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import UIKit

extension Int {
  
  var seconds: DateComponents { .init(second: self) }
  var minutes: DateComponents { .init(minute: self) }
  var hours: DateComponents { .init(hour: self) }
  var days: DateComponents { .init(day: self) }
  var weeks: DateComponents { .init(day: self * 7) }
  var months: DateComponents { .init(month: self) }
  var years: DateComponents { .init(year: self) }
}

extension Optional where Wrapped: Numeric {
  
  static prefix func -(rhs: Self) -> Wrapped? {
    switch rhs {
      case .some(let value):
        return value * -1
      case .none:
        return nil
    }
  }
  
  static func +(lhs: Self, rhs: Self) -> Wrapped? {
    switch (lhs, rhs) {
      case (.some(let lhsValue), .some(let rhsValue)):
        return lhsValue + rhsValue
      case (.none, .some(let value)), (.some(let value), .none):
        return value
      default: return nil
    }
  }
  
  static func -(lhs: Self, rhs: Self) -> Wrapped? {
    switch (lhs, rhs) {
      case (.some(let lhsValue), .some(let rhsValue)):
        return lhsValue - rhsValue
      case (.none, .some(let value)), (.some(let value), .none):
        return value
      default: return nil
    }
  }
}

extension DateComponents {
  
  var ago: Date? { Calendar.current.date(byAdding: -self, to: Date()) }
  
  var fromNow: Date? { Calendar.current.date(byAdding: self, to: Date()) }
  
  static prefix func -(rhs: Self) -> DateComponents {
    .init(year: -rhs.year,
          month: -rhs.month,
          day: -rhs.day,
          hour: -rhs.hour,
          minute: -rhs.minute,
          second: -rhs.second)
  }
  
  static func +(lhs: Self, rhs: Self) -> DateComponents {
    DateComponents(year: lhs.year + rhs.year,
                   month: lhs.month + rhs.month,
                   day: lhs.day + rhs.day,
                   hour: lhs.hour + rhs.hour,
                   minute: lhs.minute + rhs.minute,
                   second: lhs.second + rhs.second)
  }
  
  static func -(lhs: Self, rhs: Self) -> DateComponents {
    DateComponents(year: lhs.year - rhs.year,
                   month: lhs.month - rhs.month,
                   day: lhs.day - rhs.day,
                   hour: lhs.hour - rhs.hour,
                   minute: lhs.minute - rhs.minute,
                   second: lhs.second - rhs.second)
  }
}
