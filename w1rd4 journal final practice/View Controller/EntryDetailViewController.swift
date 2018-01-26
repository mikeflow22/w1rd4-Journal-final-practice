//
//  EntryDetailViewController.swift
//  w1rd4 journal final practice
//
//  Created by Michael Flowers on 1/25/18.
//  Copyright © 2018 Michael Flowers. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    //check this function at the end
    @IBAction func saveButtonTapped(_ sender: Any) {
        //if entry is existing then update, if not then add
        guard let title = titleTextField.text else {return}
        guard let body = bodyTextView.text else {return}
        
        guard let entry = entry else {
            EntryController.shared.addEntryWith(title: title, bodyText: body)
            navigationController?.popViewController(animated: true)
            return}
        EntryController.shared.updateEntry(entry: entry, title: title, bodyText: body)
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        guard let entry = entry else {
            titleTextField.text = ""
            bodyTextView.text = ""
            return
        }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
