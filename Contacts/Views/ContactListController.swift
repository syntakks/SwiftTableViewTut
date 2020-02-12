//
//  ContactListController.swift
//  Contacts
//
//  Created by Stephen Wall on 2/11/20.
//  Copyright © 2020 syntaks.io. All rights reserved.
//

import UIKit

class ContactListController: UITableViewController {
    
    let dataSource = ContactsDataSource(sectionedData: ContactsSource.sectionedContacts, sectionTitles: ContactsSource.sortedUniqueFirstLetters)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }

    // MARK: Table View Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    // FUCK SAKES THAT WAS DUMB! Literally set these values in Interface Builder to zero
    // .... it did nothing. Fun!
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsets.zero
        cell.separatorInset = UIEdgeInsets.zero
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showContact" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let contact = dataSource.object(at: indexPath)
                
                guard let navigationController = segue.destination as? UINavigationController,
                    let contactDetailController = navigationController.topViewController as? ContactDetailController else {
                        return
                }
                contactDetailController.contact = contact
                contactDetailController.delegate = self
            }
        }
    }
}

extension ContactListController: ContactDetailControllerDelegate {
    func didMarkAsFavoriteContact(_ contact: Contact) {
        guard let indexPath = dataSource.indexPath(for: contact) else { return }
        var favoriteContact = dataSource.object(at: indexPath)
        favoriteContact.isFavorite = true
        dataSource.updateContact(favoriteContact, at: indexPath)
        tableView.reloadData()
    }
}
