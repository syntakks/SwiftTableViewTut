//
//  Contact.swift
//  Contacts
//
//  Created by Stephen Wall on 2/11/20.
//  Copyright © 2020 syntaks.io. All rights reserved.
//

import UIKit

struct Contact: Equatable {
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
    let street: String
    let city: String
    let state: String
    let zip: String
    let image: UIImage?
    var isFavorite: Bool
    
    static func ==(lhs: Contact, rhs: Contact) -> Bool {
        return
            lhs.firstName == rhs.firstName &&
            lhs.lastName == rhs.lastName &&
            lhs.phone == rhs.phone &&
            lhs.email == rhs.email &&
            lhs.street == rhs.street &&
            lhs.city == rhs.city &&
            lhs.state == rhs.state &&
            lhs.zip == rhs.zip
    }
}

extension Contact {
    
    struct Key {
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let phone = "phoneNumber"
        static let email = "email"
        static let street = "streetAddress"
        static let city = "city"
        static let state = "state"
        static let zip = "zip"
        static let image = "avatarName"
    }
    
    init?(dictionary: [String: String]) {
        guard let firstNameString = dictionary[Key.firstName],
        let lastNameString = dictionary[Key.lastName],
        let phoneString = dictionary[Key.phone],
        let emailString = dictionary[Key.email],
        let streetString = dictionary[Key.street],
        let cityString = dictionary[Key.city],
        let stateString = dictionary[Key.state],
        let zipString = dictionary[Key.zip] else { return nil }
        
        self.firstName = firstNameString
        self.lastName = lastNameString
        self.phone = phoneString
        self.email = emailString
        self.street = streetString
        self.city = cityString
        self.state = stateString
        self.zip = zipString
        
        if let imageName = dictionary[Key.image] {
            self.image = UIImage(named: imageName)
        } else {
            image = nil
        }
        isFavorite = false
    }
}

extension Contact {
    var firstLetterForSort: String {
        return String(firstName.prefix(1)).uppercased()
    }
}
