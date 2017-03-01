//
//  Quotepedia.swift
//  Quoterra
//
//  Created by Song Chee Keat on 23/02/2017.
//  Copyright © 2017 Song Chee Keat. All rights reserved.
//

import UIKit

class Quotepedia: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var tableView:UITableView!
   
    
    var arrayOfQuotes:[Quote] = QuoteCRUD.findAll()
    
    override func viewDidAppear(_ animated: Bool) {
        arrayOfQuotes = QuoteCRUD.findAll()
    }
    
    override func viewDidLoad() {
        
        // Add a background view to the table view
        let backgroundImage = UIImage(named: "BlueSkyDarkNightBackground")
        let imageView = UIImageView(image: backgroundImage)
        
        // center and scale background image
        imageView.contentMode = .scaleAspectFit
        
        tableView.backgroundView = imageView
    }
    
    // MARK: Actions
    @IBAction func unwindToQuotepedia(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? QuoteViewController, let quote = sourceViewController.quote {
            
            // Add a new quote.
            let newIndexPath = IndexPath(row: arrayOfQuotes.count, section: 0)
            
            arrayOfQuotes.append(quote)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfQuotes.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath) as! QuoteTableViewCell
        
//        cell.QuoteLabel.text = "HELLO WORLD"
//        cell.QuoteAuthor.text = "CK"
//        cell.QuoteTopic.text = "Greet"
//        cell.QuoteTopic.isHighlighted = true
        
        
        cell.QuoteLabel.lineBreakMode = .byWordWrapping
        cell.QuoteLabel.numberOfLines = 0
        cell.QuoteLabel.font = UIFont(name: "BebasNeue Bold", size: 16.0)
        
        cell.QuoteLabel.text = arrayOfQuotes[indexPath.row].quotes
        cell.QuoteAuthor.text = arrayOfQuotes[indexPath.row].quoteAuthor
        cell.QuoteTopic.text = arrayOfQuotes[indexPath.row].quoteTopic
        cell.QuoteFaveStatus.isHighlighted = arrayOfQuotes[indexPath.row].quoteFavourite!
        
//        if(cell.isSelected){
//            cell.backgroundColor = UIColor.green //UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.1)
//        }else{
//            cell.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.0)
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell! = tableView.cellForRow(at: indexPath)!
            selectedCell.backgroundColor = UIColor.init(red: 255, green: 255, blue: 255, alpha: 0.1)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cellToDeselect: UITableViewCell = tableView.cellForRow(at: indexPath)!
            cellToDeselect.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.0)
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
