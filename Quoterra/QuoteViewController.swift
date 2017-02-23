//
//  QuoteViewController.swift
//  Quoterra
//
//  Created by Song Chee Keat on 21/02/2017.
//  Copyright © 2017 Song Chee Keat. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController, UITextViewDelegate{
    
    // MARK: Properties
    var placeHolderText = "Enter the Quote Here..."
    
    //@IBOutlet var favouriteButton: FaveButton!
    @IBOutlet weak var quoteTxtView:UITextView!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var topicTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Add a border to the text view
        quoteTxtView.layer.borderColor = UIColor.white.cgColor
        quoteTxtView.layer.borderWidth = 1.5
        quoteTxtView.layer.cornerRadius = 5
        
        // Set up a placeholder for the text view
        quoteTxtView.delegate = self
        
        // Change the color of the border and add it
        authorTextField.layer.borderColor = UIColor.white.cgColor
        authorTextField.layer.borderWidth = 1.5
        authorTextField.layer.cornerRadius = 5
        topicTextField.layer.borderColor = UIColor.white.cgColor
        topicTextField.layer.borderWidth = 1.5
        topicTextField.layer.cornerRadius = 5
    }
    
    // Functions to setup placeholder
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        
        self.quoteTxtView.textColor = UIColor.white
        
        if self.quoteTxtView.text == placeHolderText {
            self.quoteTxtView.text = ""
        }
        
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if(textView.text == "") {
            self.quoteTxtView.text = placeHolderText
            self.quoteTxtView.textColor = UIColor.white
        }
    }
    
    // End of the functions to setup placeholder

    // MARK: Actions
    @IBAction func setQuote(_ sender: UIButton) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
