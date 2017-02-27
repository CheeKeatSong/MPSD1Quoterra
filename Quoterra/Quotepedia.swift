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
            let newIndexPath = IndexPath(row: meals.count, section: 0)
            
            meals.append(meal)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath) as! QuoteTableViewCell
        
        cell.QuoteLabel.text = "HELLO WORLD"
        cell.QuoteAuthor.text = "CK"
        cell.QuoteTopic.text = "Greet"
        cell.QuoteTopic.isHighlighted = true
        
        return cell
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
