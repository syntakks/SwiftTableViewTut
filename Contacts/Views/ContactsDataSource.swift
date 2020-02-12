//
//  ContactsDataSource.swift
//  Contacts
//
//  Created by Stephen Wall on 2/12/20.
//  Copyright © 2020 syntaks.io. All rights reserved.
//

import Foundation
import UIKit

class ContactsDataSource: NSObject, UITableViewDataSource {
    
    private var sectionedData: [[Contact]]
    var sectionTitles: [String]
    
    init(sectionedData: [[Contact]], sectionTitles: [String]) {
        self.sectionedData = sectionedData
        self.sectionTitles = sectionTitles
        super.init()
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionedData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionedData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let contactCell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactCell else {
            fatalError()
        }
        let contact = sectionedData[indexPath.section][indexPath.row]
        // What the fuck.... These are just built right in.
        contactCell.imageView?.image = contact.image
        contactCell.nameLabel?.text = contact.firstName
        contactCell.cityLabel?.text = contact.city
        if contact.isFavorite {
            contactCell.favoriteIcon.image = #imageLiteral(resourceName: "star")
        } else {
            contactCell.favoriteIcon.image = nil
        }
        return contactCell
    }
    
    // MARK: - Helper Methods
    func object(at indexPath: IndexPath) -> Contact {
        return sectionedData[indexPath.section][indexPath.row]
    }
    
    func indexPath(for contact: Contact) -> IndexPath? {
        for (section, contacts) in sectionedData.enumerated() {
            if let row = contacts.firstIndex(of: contact) {
                return IndexPath(row: row, section: section)
            }
        }
        return nil
    }
    
    func updateContact(_ contact: Contact, at indexPath: IndexPath) {
        sectionedData[indexPath.section][indexPath.row] = contact
    }
}
