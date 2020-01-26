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
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else {
            return
        }
        
        let auto = autoTextField.text ?? ""
        let stad = stadTextField.text ?? ""
        let tarief = Int(tariefSlider.value)
        let takenUitleg = takenUitlegTextField.text ?? ""
        
        carwash = Carwash(id: 0, auto: auto, stad: stad, tarief: tarief, uitleg: takenUitleg)
    }

    // MARK: - Table view data source

    /*override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
