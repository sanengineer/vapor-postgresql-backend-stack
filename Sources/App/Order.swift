//
//  Order.swift
//  App
//
//  Created by metalbee on 8/24/20.
//

//import FluentSQLite
import FluentPostgreSQL
import Foundation
import Vapor

//struct Order: Content, SQLiteModel, Migration {
//    var id: Int?
//    var cakeName: String
//    var buyerName: String
//    var date: Date?
//}

struct Order: Content, PostgreSQLModel, Migration {
    var id: Int?
    var cakeName: String
    var buyerName: String
    var date: Date?
}
