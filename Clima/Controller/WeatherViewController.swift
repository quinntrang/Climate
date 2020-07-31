//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self
    }

    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        print(searchTextField.text!)
    }
    
    
    //text of textField will also be set if the user hits return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        //confirm that user is done editing -> dismiss keyboard
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //clear text field once search is entered
        searchTextField.text = ""
    }
    
    //check if user actually types in something
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }
        else {
            searchTextField.placeholder = "Type something"
            return false
        }
    }
}

