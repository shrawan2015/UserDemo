//
//  UserDetailViewController.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 05/03/23.
//

import UIKit

// MARK: - LoginViewController
class CusomerDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var mapViewContainerOutlet: UIView!
    @IBOutlet weak var addressOutlet: UILabel!
    @IBOutlet weak var phoneNumberOutlet: UILabel!
    @IBOutlet weak var nameOutlet: UILabel!

    // MARK: - Internal Properties
    var user:User?
}

// MARK: - View Life Cycle
extension CusomerDetailViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfiguration()
    }
    
}

// MARK: - Initial Configuration
extension CusomerDetailViewController{
    
    private func initialConfiguration(){
        if let user = user{
            self.title = user.name
            nameOutlet.text =  user.name
            addressOutlet.text = user.address.getFullAddress()
            phoneNumberOutlet.text = user.phone
            addMapViewContainer()
        }
    }

}

// MARK: - Methods
extension CusomerDetailViewController{
    
    private func addMapViewContainer(){
        let mapViewController = MapViewController()
        mapViewController.user = user
        self.add(mapViewController, frame: mapViewContainerOutlet.frame)
    }
    
}


