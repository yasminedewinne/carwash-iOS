//
//  CarwashTableViewController.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 19/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import UIKit

class CarwashTableViewController: UITableViewController {
    var carwashes = [Carwash]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CarwashController.shared.fetchCarwashes { (carwashes) in
            self.carwashes = carwashes
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.animateTable()
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carwashes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Step 1: Dequeue the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarwashCell", for: indexPath) as! CarwashTableViewCell
        
        //Step 2: Fetch model object to display
        let carwash = carwashes[indexPath.row]
        
        //Configure the cell
        cell.update(with: carwash)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showCarwashDetail", sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CarwashDetailViewController {
            destination.carwash = carwashes[(tableView.indexPathForSelectedRow!.row)]
        }
    }
    
    @IBAction func unwindToCarwashTableView(segue: UIStoryboardSegue) {
        
        guard segue.identifier == "saveUnwind",
            let sourceViewController = segue.source as? AddCarwashTableViewController,
            let carwash = sourceViewController.carwash else { return }
        
        APIClient.shared.postCarwash(carwash: carwash)
    }
    
    func animateTable() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        
        let tableViewHeight = tableView.bounds.size.height
        
        for cell in cells{
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delayCounter = 0
        for cell in cells{
            UIView.animate(withDuration: 1.60, delay: Double(delayCounter)*0.04, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
