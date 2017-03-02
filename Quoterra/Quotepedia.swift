//
//  Quotepedia.swift
//  Quoterra
//
//  Created by Song Chee Keat on 23/02/2017.
//  Copyright © 2017 Song Chee Keat. All rights reserved.
//

import UIKit
import os.log

class Quotepedia: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var tableView:UITableView!
   
    var arrayOfQuotes:[Quote] = QuoteCRUD.findAll()
    
    override func viewDidAppear(_ animated: Bool) {
//        arrayOfQuotes = QuoteCRUD.findAll()
    }
    
    override func viewDidLoad() {
        
        // Add a background view to the table view
        let backgroundImage = UIImage(named: "BlueSkyDarkNightBackground")
        let imageView = UIImageView(image: backgroundImage)
        
        // center and scale background image
        imageView.contentMode = .scaleAspectFit
        
        tableView.backgroundView = imageView
        
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: Actions
    @IBAction func unwindToQuotepedia(sender: UIStoryboardSegue){

//         Add a new quote.
        arrayOfQuotes = QuoteCRUD.findAll()
//        let newIndexPath = IndexPath(row: arrayOfQuotes.count - 1, section: 0)
//        
//        tableView.insertRows(at: [newIndexPath], with: .automatic)
        tableView.reloadData();
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
        
        cell.QuoteLabel.lineBreakMode = .byWordWrapping
        cell.QuoteLabel.numberOfLines = 0
        cell.QuoteLabel.font = UIFont(name: "BebasNeue Bold", size: 16.0)
        
        cell.QuoteLabel.text = arrayOfQuotes[indexPath.row].quotes
        cell.QuoteAuthor.text = arrayOfQuotes[indexPath.row].quoteAuthor
        cell.QuoteTopic.text = arrayOfQuotes[indexPath.row].quoteTopic
        cell.QuoteFaveStatus.isSelected = arrayOfQuotes[indexPath.row].quoteFavourite!
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedCell:UITableViewCell! = tableView.cellForRow(at: indexPath)!
//            selectedCell.backgroundColor = UIColor.init(red: 80, green: 80, blue: 80, alpha: 0.1)
//    }
//    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cellToDeselect: UITableViewCell = tableView.cellForRow(at: indexPath)!
//            cellToDeselect.backgroundColor = UIColor.clear
//    }

    //MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
        case "AddQuote":
            os_log("Adding a new meal.", log: OSLog.default, type: .debug)
            
        case "showDetails":
            guard let quoteDetailsViewController = segue.destination as? QuoteViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedQuoteCell = sender as? QuoteTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedQuoteCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedQuote = arrayOfQuotes[indexPath.row]
            quoteDetailsViewController.quote = selectedQuote
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
