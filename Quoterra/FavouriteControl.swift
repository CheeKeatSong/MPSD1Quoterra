//
//  FavouriteControl.swift
//  Quoterra
//
//  Created by Song Chee Keat on 22/02/2017.
//  Copyright © 2017 Song Chee Keat. All rights reserved.
//

import UIKit

@IBDesignable class FavouriteControl: UIStackView {
    
    //MARK: Properties
    private var favouriteButton = [UIButton]()
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    
    var favourite = false

    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder){
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
    
    // MARK: Private Methods
    private func setupButtons(){
        
        // clear any existing buttons
        for button in favouriteButton {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        // Create the button
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        // Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
        
        // Setup the button action
        button.addTarget(self, action: #selector(FavouriteControl.ratingButtonTapped(button:)), for: .touchUpInside)
        
        // Add the button to the stack
        addArrangedSubview(button)
        
        // Add the new button to the rating button array
        favouriteButton.append(button)
    }
    
}
