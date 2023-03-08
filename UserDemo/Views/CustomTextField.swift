//
//  CustomTextField.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 06/03/23.
//

import Foundation
import UIKit

// MARK: - CustomTextField
class CustomTextField: UITextField {
    
    // MARK: - Public Properties
    var textFieldType: TextFieldType = .default {
        didSet {
            typeConfiguration()
        }
    }
    
    private var pickerView: UIPickerView? {
        let picker : UIPickerView = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }
    
    private lazy var countries:[String] = {
        return Country.getCountries()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialConfiguration()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialConfiguration()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Initial Configuration
extension CustomTextField{
    
    fileprivate func initialConfiguration() {
        textConfiguration()
        typeConfiguration()
        placeHoldeConfiguration()
        addDoneButtonOnKeyboard()
    }
    
    fileprivate func textConfiguration(){
        textAlignment = .left
        textColor = UIColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 0.6)
        font =  UIFont(name: "SFProText-Regular", size: 17)
        backgroundColor = .clear
        layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6).cgColor
    }
    
    func placeHoldeConfiguration(){
        let attributes = [ NSAttributedString.Key.foregroundColor: UIColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 0.4) ]
        let placeHolderString = NSAttributedString(string: placeholder ?? "", attributes: attributes)
        attributedPlaceholder = placeHolderString
    }
    
    fileprivate func typeConfiguration() {
        // Text and Keyboard Type
        self.textContentType = self.textFieldType.textContentType
        self.keyboardType = self.textFieldType.keyboarType
    
        switch textFieldType {
            case .password:
                self.isSecureTextEntry = true
            default:
                self.autocapitalizationType = .none
                self.isSecureTextEntry = false
        }
    }
    
}

// MARK: - Methods
extension CustomTextField{
    fileprivate func addDoneButtonOnKeyboard() {
          let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
          doneToolbar.barStyle = .default

          let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
          let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

          let items = [flexSpace, done]
          doneToolbar.items = items
          doneToolbar.sizeToFit()

          self.inputAccessoryView = doneToolbar
      }

      @objc fileprivate func doneButtonAction() {
          self.resignFirstResponder()
      }
}

// MARK: - Methods
extension CustomTextField{
    func configurePicker() {
        self.inputView = pickerView
    }
    
    func removePicker() {
        self.inputView = nil
    }
}


// MARK: - UITextFieldDelegate
extension CustomTextField: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        pickerView?.isHidden = false
        return false
    }
}

// MARK: - UIPickerViewDelegate
extension CustomTextField: UIPickerViewDelegate{
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        text = countries[row]
    }
}

// MARK: - UIPickerViewDataSource
extension CustomTextField: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
}


