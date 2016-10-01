//
//  PickerView.swift
//  StarWars
//
//  Created by Karim on 30/09/2016.
//  Copyright © 2016 KRS. All rights reserved.
//

import UIKit

protocol NewCharacterPickerDelegate: class {
    func NewFactionPicker(_ pickerView: PickerView, faction: Character.Faction)
    func NewSpeciePicker(_ pickerView: PickerView, specie: Character.Specie)
}

class PickerView: UIView {

    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    
    static let nibIdentifier = "PickerView"
    weak var delegate: NewCharacterPickerDelegate?
    var isFaction: Bool?

    override func awakeFromNib() {
        super.awakeFromNib()
        picker.delegate = self
        picker.dataSource = self
    }
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    func setBackImage(image: UIImage) {
        backImage.image = image
    }
    
    func changeFaction(){
        isFaction = true
    }
    
    func changeSpecie() {
        isFaction = false
    }
    
    @IBAction func doneAction(_ sender: AnyObject) {
        
        if isFaction == true {
            delegate?.NewFactionPicker(self, faction: Character.Faction.all[picker.selectedRow(inComponent: 0)])
        }else{
            delegate?.NewSpeciePicker(self, specie: Character.Specie.all[picker.selectedRow(inComponent: 0)])
        }
        self.removeFromSuperview()
    }
}

extension PickerView: UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        var rows = 0
        
        if isFaction == true {
            rows = Character.Faction.all.count
        }else{
            rows = Character.Specie.all.count

        }
        return rows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var str = ""
        
        if isFaction == true {
            str = Character.Faction.all[row].name
        }else{
            str = Character.Specie.all[row].name

        }
        return str
    }
}


    
    

