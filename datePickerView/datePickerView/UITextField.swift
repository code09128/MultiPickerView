//
//  UITextField.swift
//  datePickerView
//
//  Created by Dustin on 2019/11/12.
//  Copyright © 2019 Dustin. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setInputViewDatePicker(target: Any, selector: Selector) {
        //建立pickerView視窗
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePicker.datePickerMode = .date
        datePicker.locale = NSLocale.init(localeIdentifier: "zh_CHS_CN") as Locale 
        self.inputView = datePicker
        
        //建立上方toolBar按鈕功能
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 40.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
}
