//
//  ViewController.swift
//  MultiPickerView
//
//  Created by Dustin on 2019/11/12.
//  Copyright © 2019 Dustin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var eventext: UITextField!
    @IBOutlet weak var duration: UITextField!
    
    @IBOutlet var myView: UIView!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    
    var currentTextfield = UITextField()
    var pickerView:UIPickerView = UIPickerView()
    
    var evenType:[String] = []
    var durationa:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datePickerView.locale = NSLocale.init(localeIdentifier: "zh_CHS_CN") as Locale //選擇格式為中式
        datePickerView.datePickerMode = .date
        
        myLabel.isUserInteractionEnabled = true
        myLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onSelectChoose)))
        
        evenType = ["1","2","3"]
        durationa = ["1-5","6-10","11-15"]
    }

    override func viewWillAppear(_ animated: Bool) {
        view.addSubview(myView)
        myView.translatesAutoresizingMaskIntoConstraints = false //關閉自動layout
        
        myView.heightAnchor.constraint(equalToConstant: 150).isActive = true //Active如不等於true屬性設定完沒作用
        myView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        myView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        let c = myView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 150)
        
        c.identifier = "bottom"
        c.isActive = true
        
        myView.layer.cornerRadius = 10
        
        super.viewWillAppear(animated)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if currentTextfield == eventext{
            return evenType.count
        }else if currentTextfield == duration{
            return durationa.count
        }else{
            return 0
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if currentTextfield == eventext{
            return evenType[row]
        }else if currentTextfield == duration{
            return durationa[row]
        }else{
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if currentTextfield == eventext{
            eventext.text = evenType[row]
            self.view.endEditing(true)
        }else if currentTextfield == duration{
            duration.text = durationa[row]
            self.view.endEditing(true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        currentTextfield = textField
        
        if currentTextfield == eventext{
            currentTextfield.inputView = pickerView
        }else if currentTextfield == duration{
            currentTextfield.inputView = pickerView
        }
    }
    
    @IBAction func doneClick(_ sender: UIButton) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        let strDate = dateFormatter.string(from: datePickerView.date)
        
//        button.setTitle(strDate, for: .normal)
        myLabel.text = strDate
        
        displayPickerView(false)
    }
    
    @IBAction func selClick(_ sender: UIButton) {
        displayPickerView(true)
    }
    
    /**選擇開始日期*/
    @objc func onSelectChoose() {
        displayPickerView(true)
    }
    
    
    func displayPickerView(_ show:Bool){
        for c in view.constraints{
            if c.identifier == "bottom"{
                c.constant = (show) ? -10 : 150
                break
            }
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}

