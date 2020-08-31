//
//  Cupcake.swift
//  App
//
//  Created by metalbee on 8/24/20.
//

//import FluentSQLite
import FluentPostgreSQL
import Foundation
import Vapor

//struct Cupcake: Content, SQLiteModel, Migration {
//    var id: Int?
//    var name: String
//    var description: String
//    var price: Int
//}

struct Cupcake: Content, PostgreSQLModel, Migration {
    var id: Int?
    var name: String
    var description: String
    var price: Int
}
