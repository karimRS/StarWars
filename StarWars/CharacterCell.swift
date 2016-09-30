//
//  CharacterCell.swift
//  StarWars
//
//  Created by Karim on 29/09/2016.
//  Copyright © 2016 KRS. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var labelCell: UILabel!
    
    static let cellIdentifier = "characterCell"
    static let nibIdentifier = "CharacterCell"

    var character: Character? {
        
        didSet{
            labelCell.text = character?.name ?? ""
            imageViewCell.image = character?.specie.image ?? nil
        }
    }
    
    func updateCell(character: Character) {
        
        imageViewCell.image = character.specie.image
        labelCell.text = character.name
    }
}

