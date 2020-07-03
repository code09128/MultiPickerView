//
//  ViewController.swift
//  datePickerView
//
//  Created by Dustin on 2019/11/12.
//  Copyright © 2019 Dustin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var dateText2: UITextField!
    
    private var datePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dateText.setInputViewDatePicker(target: self, selector: #selector(tapDone)) //1
        self.dateText2.setInputViewDatePicker(target: self, selector: #selector(tapDone2)) //1
    }

    //2
    @objc func tapDone() {
        if let datePicker = self.dateText.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.dateFormat = "yyyy/MM/dd" // 2-3
            self.dateText.text = dateformatter.string(from: datePicker.date) //2-4
        }
        self.dateText.resignFirstResponder() // 2-5
    }
    
    //2
    @objc func tapDone2() {
        if let datePicker = self.dateText2.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.dateFormat = "yyyy/MM/dd" // 2-3
            self.dateText2.text = dateformatter.string(from: datePicker.date) //2-4
        }
        self.dateText2.resignFirstResponder() // 2-5
    }
}

