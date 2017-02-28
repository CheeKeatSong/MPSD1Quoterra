//
//  Quote.swift
//  Quoterra
//
//  Created by Song Chee Keat on 19/02/2017.
//  Copyright © 2017 Song Chee Keat. All rights reserved.
//

import UIKit
import os.log

class Quote {
    
    //MARK: properties
    var quoteID:Int64?
    var quotes:String?
    var quoteAuthor:String?
    var quoteTopic:String?
    var quoteFavourite:Bool?
    
    init?(){
    }

    //MARK: Initialization
    init?(quoteID: Int64, quotes: String, quoteAuthor: String, quoteTopic: String, quoteFavourite: Bool){
        
        // The quote must not be empty
        guard !quotes.isEmpty else {
            return nil
        }
        
        // The quote author must not be empty
        guard !quoteAuthor.isEmpty else {
            return nil
        }
        
        // The quote author must not be empty
        guard !quoteTopic.isEmpty else {
            return nil
        }
        
        //Initialize stored properties
        self.quoteID = quoteID
        self.quotes = quotes
        self.quoteAuthor = quoteAuthor
        self.quoteTopic = quoteTopic
        self.quoteFavourite = quoteFavourite
    }				
}
