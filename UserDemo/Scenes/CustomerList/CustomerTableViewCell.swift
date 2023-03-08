//
//  CustomerTableViewCell.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 05/03/23.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var addressOutlet: UILabel!
    @IBOutlet weak var phoneNumberOutlet: UILabel!
    
    // MARK: - Internal Properties
    var user:User?{
        didSet{
            if let user = user{
                nameOutlet.text = user.name
                addressOutlet.text = user.address.getFullAddress()
                phoneNumberOutlet.text = user.phone
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Initial Configuration
extension CustomerTableViewCell{
    func update(_ user:User){
        self.user = user
    }
}
