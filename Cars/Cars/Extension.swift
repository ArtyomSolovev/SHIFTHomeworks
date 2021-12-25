//
//  Extension.swift
//  Cars
//
//  Created by Артем Соловьев on 12.12.2021.
//

import UIKit

class CheckBox: UIButton {
    let checkedImage = UIImage(systemName: "checkmark.circle")! as UIImage
    let uncheckedImage = UIImage(systemName: "circle")! as UIImage
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    func buttonClicked() {
            isChecked = !isChecked
    }
}
