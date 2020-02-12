//
//  ContactDetailController.swift
//  Contacts
//
//  Created by Stephen Wall on 2/11/20.
//  Copyright © 2020 syntaks.io. All rights reserved.
//

import UIKit

protocol ContactDetailControllerDelegate: class {
    func didMarkAsFavoriteContact(_ contact: Contact)
}

class ContactDetailController: UITableViewController {
    
    var contact: Contact?
    // UI Outlets
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    
    weak var delegate: ContactDetailControllerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        if let contact = contact {
            contactImageView.image = contact.image
            nameLabel.text = "\(contact.firstName) \(contact.lastName)"
            phoneLabel.text = contact.phone
            emailLabel.text = contact.email
            streetLabel.text = contact.street
            cityLabel.text = contact.city
            stateLabel.text = contact.state
            zipLabel.text = contact.zip
        }
    }
    @IBAction func markAsFavorite(_ sender: Any) {
        guard let contact = contact else { return }
        delegate?.didMarkAsFavoriteContact(contact)
    }
}
