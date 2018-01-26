//
//  EntryController.swift
//  w1rd4 journal final practice
//
//  Created by Michael Flowers on 1/25/18.
//  Copyright © 2018 Michael Flowers. All rights reserved.
//

import Foundation

class EntryController {
    static var shared = EntryController()
    var entries : [Entry] = []
    
    //LOAD THE PERSISTENCE -------KEY PART
    init() {
        self.entries = loadFromPersistence()
    }
    //crud functions
    
    func addEntryWith(title: String, bodyText: String){
        let addEntry = Entry(title: title, bodyText: bodyText)
        entries.append(addEntry)
        saveToPersistence()
    }
    
    //create URL
    
    func fileURL() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let fileName = "Entry.json"
        let url = documentDirectory.appendingPathComponent(fileName)
        return url
    }
    
    //save function
    
    func saveToPersistence(){
        do {
            let je = JSONEncoder()
            let data = try je.encode(entries)
            try data.write(to: fileURL())
        } catch let e {
            print("\(e), \(e.localizedDescription)")
        }
    }
    
    //load - check return of empty array
    func loadFromPersistence() -> [Entry] {
        do {
            let jd = JSONDecoder()
            let data = try Data(contentsOf: fileURL())
            let entries = try jd.decode([Entry].self, from: data)
            return entries
        } catch let e {
            print("\(e), \(e.localizedDescription)")
           // return []
        }
        return []
    }
    
    func updateEntry(entry: Entry, title: String, bodyText: String) {
        entry.title = title
        entry.bodyText = bodyText
        saveToPersistence()
    }
    
    func remove(entry: Entry){
        guard let entryToRemove = entries.index(of: entry) else {return}
        entries.remove(at: entryToRemove)
        saveToPersistence()
    }
}





