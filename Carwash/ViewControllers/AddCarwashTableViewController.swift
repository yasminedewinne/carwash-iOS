//
//  AddCarwashTableViewController.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 19/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import UIKit

class AddCarwashTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var carwash: Carwash!
    var autos : [Auto] = [Auto]()
    var selectedAuto: Int = 0
    var gebruikerId: Int = 0
    
    @IBOutlet var autoPicker: UIPickerView!
    @IBOutlet var tariefLabel: UILabel!
    @IBOutlet var takenUitlegTextField: UITextField!
    @IBOutlet var tariefSlider: UISlider!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var datumEnTijdLabel: UILabel!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data to autoPicker:
        self.autoPicker.delegate = self
        self.autoPicker.dataSource = self
        
        updateSaveButtonState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        CarwashController.shared.fetchAutosGebruiker { (autos) in
            self.autos = autos
            DispatchQueue.main.async { self.autoPicker.reloadAllComponents() }
        }
    }
    
    //Code voor PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.autos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.autos[row].merk + " " + self.autos[row].naam
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedAuto = autos[row].id
        self.gebruikerId = autos[row].gebruikerId
    }
    //Einde code voor PickerView
    
    func updateSaveButtonState() {
        //let stadText = stadTextField.text ?? ""
        let takenUitlegText = takenUitlegTextField.text ?? ""
        
        saveButton.isEnabled = !takenUitlegText.isEmpty
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
        let autoId = self.selectedAuto
        let gebruikerId = self.gebruikerId
        
        carwash = Carwash(id: 0, tarief: tarief, uitleg: takenlijst, datumEnUur: datumEnUur, gebruikerId: gebruikerId, autoId: autoId)
    }
}
