//
//  SQLiteDBManager.swift
//  Quoterra
//
//  Created by Song Chee Keat on 20/02/2017.
//  Copyright © 2017 Song Chee Keat. All rights reserved.
//

import UIKit
import SQLite
import Foundation

protocol DataHelperProtocol {
    associatedtype T
    static func createTable() -> Void
    static func insert(item:T) -> Void
    static func delete() -> Void
    static func update(item:T) -> Void
    static func find() -> T
    static func findAll() -> [T]
}

enum SQLERROR: Error {
    case FoundNil(String)
}

class SQLiteDBManager: NSObject {
    
    static let sharedInstance = SQLiteDBManager()
    
    override init() {
    }
    
    func createDB() -> Connection {
        
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true).first!
        
        let db = try! Connection("\(path)/db.sqlite3")
        
        return db
    }
    
    func createTable() {
        QuoteCRUD.createTable()
    }
    
    static func makeDB() {
        let sql = SQLiteDBManager()
        
        if Utilities.isObjectNil(object: sql.createDB()) {
            print("Not empty")
        }
        
        sql.createTable()
    }
}
