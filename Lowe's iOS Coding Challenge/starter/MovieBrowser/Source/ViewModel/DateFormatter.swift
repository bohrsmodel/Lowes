//
//  DateFormatter.swift
//  MovieBrowser
//
//  Created by Ling on 12/9/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

let dateFormatterMFirst: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "M/dd/yyyy"
    dateFormatter.timeZone = TimeZone.current
    return dateFormatter
}()

let dateFormatterMMM: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d, yyyy"
    dateFormatter.timeZone = TimeZone.current
    return dateFormatter
}()

let dateFormatterYFirst: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-M-dd"
    
    return dateFormatter
}()
