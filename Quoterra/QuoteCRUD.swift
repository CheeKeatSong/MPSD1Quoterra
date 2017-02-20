//
//  QuoteCRUD.swift
//  Quoterra
//
//  Created by Song Chee Keat on 20/02/2017.
//  Copyright © 2017 Song Chee Keat. All rights reserved.
//

import UIKit
import SQLite

class QuoteCRUD: DataHelperProtocol {
    static let TABLE_NAME = "Quotes"
    
    //Table data name
    static let quoteID = Expression<Int64>("quoteID")
    static let quotes = Expression<String>("quotes")
    static let quoteAuthor = Expression<String>("quoteAuthor")
    static let quoteTopic = Expression<String>("quoteTopic")
    static let quoteFavourite = Expression<Bool>("quoteFavourite")
    
    static let db = SQLiteDBManager()
    static let quote = Table(TABLE_NAME)
    
    typealias T = Quote
    
    //Functions called to do create table
    static func createTable() {
        do {
            try db.createDB().run(quote.create(ifNotExists: true){ table in
                table.column(quoteID,primaryKey:.autoincrement)
                table.column(quotes, unique:true)
                table.column(quoteAuthor)
                table.column(quoteTopic)
                table.column(quoteFavourite)
            })
        } catch let error as NSError {
            print("Table creation error \(error)")
        }
    }
    
    //Insert to db
    static func insert(item: Quote) {
        if Utilities.isObjectNil(object: item) {
            //Delete old entry to insert new one
            delete()
            
            do {
                try db.createDB().run(quote.insert(
                    quotes <- item.quotes!,
                    quoteAuthor <- item.quoteAuthor!,
                    quoteTopic <- item.quoteTopic!,
                    quoteFavourite <- item.quoteFavourite!
                ))
            } catch let error as NSError {
                print("Insertion failed: \(error)")
            }
        } else {
            print("Item is empty")
        }
    }
    
    //Bulk Insert
    static func bulkInsert(item:[Quote]) {
        if Utilities.isObjectNil(object: item as AnyObject!) {
            //Delete old entry to insert new one
            delete()
            
            do {
                for index in 0..<item.count {
                    try db.createDB().run(quote.insert(
                        quotes <- item[index].quotes!,
                        quoteAuthor <- item[index].quoteAuthor!,
                        quoteTopic <- item[index].quoteTopic!,
                        quoteFavourite <- item[index].quoteFavourite!
                    ))
                }
            } catch let error as NSError {
                print("Bulk Insertion failed: \(error)")
            }
        } else {
            print("Item is empty")
        }
    }
    
    static func delete() {
        do {
            try db.createDB().run(quote.delete())
        } catch let error as NSError {
            print("Delete failed: \(error)")
        }
    }
    
    static func update(item: Quote) {
        
    }
    
    static func find() -> Quote {
        let results = Quote()
        
        return results!
    }
    
    static func findAll() -> [Quote] {
        var quoteArray = [T]()
        
        do {
            for item in try db.createDB().prepare(quote) {
                quoteArray.append(Quote(
                    quoteID:item[quoteID],
                    quotes:item[quotes],
                    quoteAuthor:item[quoteAuthor],
                    quoteTopic:item[quoteTopic],
                    quoteFavourite:item[quoteFavourite]
                )!)
            }
        } catch let error as NSError {
            print("Delete failed: \(error)")
        }
        
        return quoteArray
    }
}
