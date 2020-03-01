//
//  Holiday.swift
//  Calendary
//
//  Created by Rafael on 01/03/2020.
//  Copyright © 2020 RafaelAB. All rights reserved.
//

import Foundation

struct HolidayResponse: Decodable {
    var response: Holidays
}

struct Holidays: Decodable {
    var holidays: [HolidayDetail]
}

struct HolidayDetail: Decodable {
    var name: String
    var date: DateInfo
}

struct DateInfo: Decodable {
    var iso: String
}
