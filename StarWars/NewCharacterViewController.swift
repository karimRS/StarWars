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

class NewCharacterViewController: UIViewController, UIGestureRecognizerDelegate {

    weak var delegate: NewCharacterViewControllerDelegate?
    var pickerController: PickerView!
    var selectedFaction = Character.Faction.Rebel
    var selectedSpecie = Character.Specie.Ewok

    @IBOutlet weak var specieButton: UIButton!
    @IBOutlet weak var factionButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: Selector({"handleTap"}()))
        tap.delegate = self
        view.addGestureRecognizer(tap)
        
        }
    
    func handleTap(){
        nameTextField.resignFirstResponder()
    }

    func getBlur() -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size,
                                               true, 1)
        self.view.drawHierarchy(in: self.view.bounds,
                                afterScreenUpdates: true)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return (screenshot?.applyLightEffect())!
    }

    @IBAction func save(_ sender: AnyObject) {
        
        guard nameTextField.text != "" else {
            print("notext")
            //TODO: alert
            return
        }
        
        let char = Character(name: nameTextField.text!,specie: selectedSpecie,faction: selectedFaction)
        delegate?.NewCharacterViewController(self, created: char)
    }
    
    @IBAction func cancel(_ sender: AnyObject) {
        nameTextField.resignFirstResponder()
        delegate?.NewCharacterViewControllerDidCancel(self)
    }
    
    func enableSaveButton() {
        saveBarButton.isEnabled = true
    }
    
    @IBAction func changeFaction(_ sender: AnyObject) {
        
        nameTextField.resignFirstResponder()
        pickerController = UINib(nibName: PickerView.nibIdentifier, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! PickerView
        pickerController.delegate = self
        saveBarButton.isEnabled = false
        
        let image = getBlur()
        pickerController.setBackImage(image: image)
        pickerController.changeFaction()
        
        pickerController.bounds = view.bounds
        pickerController.center = view.center
        
        view.addSubview(pickerController)
        
    }

    @IBAction func changeSpecie(_ sender: AnyObject) {
        
        nameTextField.resignFirstResponder()
        pickerController = UINib(nibName: PickerView.nibIdentifier, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! PickerView
        pickerController.delegate = self
        saveBarButton.isEnabled = false
        
        let image = getBlur()
        pickerController.setBackImage(image: image)
        pickerController.changeSpecie()
        
        pickerController.bounds = view.bounds
        pickerController.center = view.center
        
        view.addSubview(pickerController)
    }

}

extension NewCharacterViewController: NewCharacterPickerDelegate {
    
    func NewFactionPicker(_ pickerView: PickerView, faction: Character.Faction) {
        
        self.enableSaveButton()
        selectedFaction = faction
        self.factionButton.setImage(faction.image, for: .normal)
        
    }
    
    func NewSpeciePicker(_ pickerView: PickerView, specie: Character.Specie) {
        
        self.enableSaveButton()
        selectedSpecie = specie
        self.specieButton.setImage(specie.image, for: .normal)
    }
    
}

// MARK: - UITextFieldDelegate

extension NewCharacterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
}

