//
//  CustomPasswordField.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/17/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class CustomAnimatedTextField: SkyFloatingLabelTextFieldWithIcon{
    
    var selectedColor: UIColor!
    var icon: UIImage!
    var placeholderText: String!
    var floatedText: String!
    var secure: Bool!
    
    required init(placeholderText: String, floatedText: String, selectedColor: UIColor, icon: UIImage, secure: Bool = false) {
        super.init(frame: .zero)
        self.placeholderText = placeholderText
        self.floatedText = floatedText
        self.selectedColor = selectedColor
        self.icon = icon
        self.secure = secure
        
        setup()
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        let textfield = SkyFloatingLabelTextFieldWithIcon(frame: CGRect(x: 150, y: 10, width: 120, height: 45))
        let selectedColor = UIColor(red:0.00, green:0.46, blue:0.60, alpha:1.0)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        self.placeholder = placeholderText
 
        self.title = floatedText
        
        self.font = UIFont(name: "Helvetica-Bold", size: 18)
        self.placeholderFont = UIFont(name: "Helvetica", size: 18)
        self.selectedLineColor = selectedColor
        self.selectedTitleColor = selectedColor
        self.selectedIconColor = selectedColor
        self.textColor = selectedColor
        self.tintColor = selectedColor
        self.iconType = .image
        self.iconColor = .lightGray
        self.iconImage = icon
        self.isSecureTextEntry = secure
        
    }
    
}
