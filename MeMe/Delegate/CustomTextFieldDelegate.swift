//
//  CustomTextFieldDelegate.swift
//  MeMe
//
//  Created by Sai Leung on 4/19/18.
//  Copyright © 2018 Sai Leung. All rights reserved.
//

import Foundation
import UIKit

class CustomTextFieldDelegate: NSObject, UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}
