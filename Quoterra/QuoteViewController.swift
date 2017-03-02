//
//  QuoteViewController.swift
//  Quoterra
//
//  Created by Song Chee Keat on 21/02/2017.
//  Copyright © 2017 Song Chee Keat. All rights reserved.
//

import UIKit
import os.log
import FaveButton

class QuoteViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate, FaveButtonDelegate{
    
    // MARK: Properties
    var placeHolderText = "Enter the Quote Here..."
    var faveValue = false
    
    // @IBOutlet var favouriteButton: FaveButton!
    @IBOutlet weak var quoteTxtView:UITextView!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var topicTextField: UITextField!
    @IBOutlet weak var favButton: FaveButton!
    @IBOutlet weak var quoteIDLabel: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var quoteID: UILabel!
    
    // Quote data model
    var quote: Quote? = Quote()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        favButton.delegate = self
        
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
        
        // Set up view for existing quote
        if let quote = quote {
            navigationController?.title = ""
            quoteTxtView.text = quote.quotes
            authorTextField.text = quote.quoteAuthor
            topicTextField.text = quote.quoteTopic
            favButton.isSelected = quote.quoteFavourite ?? false
        }
        
        updateSaveButton()
        
        // Forced the navigation not to disappear
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        
//        super.viewWillDisappear(animated)
//        self.navigationController?.isNavigationBarHidden = false
//    }
    
//    @IBAction func saveQuote(_ sender: Any) {
//        quote?.quotes = quoteTxtView.text ?? ""
//        quote?.quoteAuthor = authorTextField.text ?? ""
//        quote?.quoteTopic = topicTextField.text ?? ""
//        quote?.quoteFavourite = faveValue
//        
//        QuoteCRUD.insert(item: quote!)
//        
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Quotepedia") as! Quotepedia
//        self.present(vc, animated: true, completion: nil)
//    }
    
    @IBAction func cancel(_ sender: Any) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Quotepedia") as! Quotepedia
//        self.present(vc, animated: true, completion: nil)
          navigationController?.popViewController(animated: true)
          dismiss(animated: true, completion: nil)
    }
    
    // This method lets you configure a view controller before it's presented.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        quote?.quotes = quoteTxtView.text ?? ""
        quote?.quoteAuthor = authorTextField.text ?? ""
        quote?.quoteTopic = topicTextField.text ?? ""
        quote?.quoteFavourite = faveValue
        
        if (quote?.quoteID == nil){
            QuoteCRUD.insert(item: quote!)
        }
        else{
            QuoteCRUD.update(item: quote!)
        }
        
    }
    
    
    func faveButton(_ faveButton: FaveButton, didSelected selected: Bool) {
        if selected == true {
            faveValue = true
            print (faveValue)
        } else {
            faveValue = false
            print (faveValue)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButton()
    }

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        
        // Text View placeholder
        self.quoteTxtView.textColor = UIColor.white
        
        if self.quoteTxtView.text == placeHolderText {
            self.quoteTxtView.text = ""
        }
        
        // Save button disabled when typing
        saveButton.isEnabled = false
        
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        // Textview place holder
        if(textView.text == "") {
            self.quoteTxtView.text = placeHolderText
            self.quoteTxtView.textColor = UIColor.white
        }
        
        updateSaveButton()
    }

    // MARK: Actions
    @IBAction func setQuote(_ sender: UIButton) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Private Methods
    private func updateSaveButton(){
        // Disable the Save button if the text field is empty.
        let quoteText = quoteTxtView.text ?? ""
        let quoteAuthorText = authorTextField.text ?? ""
        let quoteTopicText = topicTextField.text ?? ""
        
        saveButton.isEnabled = (!quoteText.isEmpty) && (!quoteAuthorText.isEmpty) && (!quoteTopicText.isEmpty)
    }

}
