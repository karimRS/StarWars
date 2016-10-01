//
//  NewCharacterView.swift
//  StarWars
//
//  Created by Karim on 30/09/2016.
//  Copyright © 2016 KRS. All rights reserved.
//

import UIKit

class NewCharacterView: UIView {

    
    @IBOutlet weak var specieButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var factionLabel: UIButton!
    
    func setSpecieImage(image: UIImage) {
        
        specieButton.setImage(image, for: .normal)
    }
    
    func setFactionImage(image: UIImage) {
        
        factionLabel.setImage(image, for: .normal)
    }
    
}
