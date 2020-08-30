//
//  AfsprakenTableViewController.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 19/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import UIKit

class AfsprakenTableViewController: UITableViewController {
    var afspraken = [Afspraak]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        CarwashController.shared.fetchAfsprakenGebruiker { (afspraken) in
            self.afspraken = afspraken
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return afspraken.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Step 1: Dequeue the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "AfspraakCell", for: indexPath) as! AfspraakTableViewCell
        
        //Step 2: Fetch model object to display
        let afspraak = afspraken[indexPath.row]
        
        //Configure the cell
        cell.update(with: afspraak)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            APIClient.shared.deleteAfspraak(afspraakId: afspraken[indexPath.row].id)
            afspraken.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
