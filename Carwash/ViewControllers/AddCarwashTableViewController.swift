//
//  AddCarwashTableViewController.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 19/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import UIKit

class AddCarwashTableViewController: UITableViewController {
    
    var carwash: Carwash!
    
    @IBOutlet var autoTextField: UITextField!
    @IBOutlet var stadTextField: UITextField!
    @IBOutlet var tariefLabel: UILabel!
    @IBOutlet var takenUitlegTextField: UITextField!
    @IBOutlet var tariefSlider: UISlider!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var datumEnTijdLabel: UILabel!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateSaveButtonState()
    }
    
    func updateSaveButtonState() {
        let autoText = autoTextField.text ?? ""
        let stadText = stadTextField.text ?? ""
        let takenUitlegText = takenUitlegTextField.text ?? ""
        
        saveButton.isEnabled = !autoText.isEmpty && !stadText.isEmpty && !takenUitlegText.isEmpty
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField){
        updateSaveButtonState()
    }
    
    @IBAction func sliderAdaptsLabel(_ sender: UISlider) {
        
        tariefLabel.text = "€ " + String(Int(sender.value))
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let date = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        datumEnTijdLabel.text = dateFormatter.string(from: date)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else {
            return
        }
        
        let tarief = Int(tariefSlider.value)
        let takenlijst = takenUitlegTextField.text ?? ""
        let datumEnUur = String(datumEnTijdLabel.text ?? "")
        
        //carwash = Carwash(id: 0, tarief: tarief, uitleg: takenlijst, datumEnUur: datumEnUur, gebruikerId: 0, autoId: 0)
    }
}
