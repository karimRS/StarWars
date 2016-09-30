//
//  NewCharacterViewController.swift
//  StarWars
//
//  Created by Karim on 30/09/2016.
//  Copyright © 2016 KRS. All rights reserved.
//

import UIKit

protocol NewCharacterViewControllerDelegate: class {
    func NewCharacterViewController(_ newCharacterViewController: NewCharacterViewController, created: Character)
    func NewCharacterViewControllerDidCancel(_ newCharacterViewController: NewCharacterViewController)
}


class NewCharacterViewController: UIViewController {

    weak var delegate: NewCharacterViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func cancel(_ sender: AnyObject) {
      //  closeKeyboard()
        delegate?.NewCharacterViewControllerDidCancel(self)
    }

}
