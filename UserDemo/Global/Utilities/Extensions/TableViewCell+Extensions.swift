//
//  TableView.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 07/03/23.
//

import Foundation
import UIKit

// MARK: - UITableViewCell
extension UITableViewCell {
    
    // MARK: Interal Static Properties
    static var cellIdentifier: String { return String(describing: self) }
    static var cellNib: UINib { return UINib(nibName: cellIdentifier, bundle: nil) }
    func noSelectionStyle() {
        self.selectionStyle = .none
    }
}
