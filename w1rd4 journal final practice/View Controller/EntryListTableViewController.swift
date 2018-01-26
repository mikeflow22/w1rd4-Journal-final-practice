//
//  EntryListTableViewController.swift
//  w1rd4 journal final practice
//
//  Created by Michael Flowers on 1/25/18.
//  Copyright © 2018 Michael Flowers. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUPUI()
    }
    
    //test this at the end
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.shared.entries.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        //get data indexpath
        let entry = EntryController.shared.entries[indexPath.row]
        //merge
        cell.textLabel?.text = entry.title
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let entryToDelete = EntryController.shared.entries[indexPath.row]
            EntryController.shared.remove(entry: entryToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let clearColor = UIColor.clear
        cell.backgroundColor = UIColor(white: 1, alpha: 0.20)
        cell.textLabel?.backgroundColor = clearColor
        cell.detailTextLabel?.backgroundColor = clearColor
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //I.D.I.D.P.
        if segue.identifier == "cellSelected"{
            guard let toDetailVC = segue.destination as? EntryDetailViewController, let index = tableView.indexPathForSelectedRow else {return}
            let entry = EntryController.shared.entries[index.row]
            toDetailVC.entry = entry
        }
    }
    

}

extension EntryListTableViewController {
    func setUPUI() {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "background"))
        tableView.backgroundView = imageView
        imageView.contentMode = .scaleAspectFit
        
        //make a blurr effect
        let blurEffect = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = imageView.bounds
        imageView.addSubview(blurView)
        blurView.clipsToBounds = true
    }
}

