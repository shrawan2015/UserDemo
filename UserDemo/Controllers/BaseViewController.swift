//
//  BaseViewController.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 06/03/23.
//

import UIKit

// MARK: - BaseViewController
class BaseViewController: UIViewController {
    
    var appDelegate : AppDelegate? {
         return UIApplication.shared.delegate as? AppDelegate
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - Life cycle
extension BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Screen Name \(self)")
        view.backgroundColor = .white
        showNavigationShadow()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.endEditing(true)
    }
}

// MARK: - Show and Hide Navigationbar
extension BaseViewController {
    
    func hideNavigationShadow() {
        self.navigationController?.navigationBar.layer.cornerRadius = 0
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.clear.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 1
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.navigationController?.navigationBar.layer.shadowRadius = 0.0
    }
    
    func showNavigationShadow() {
        self.navigationController?.navigationBar.layer.cornerRadius = 6
        self.navigationController?.navigationBar.layer.shadowColor = #colorLiteral(red: 0.13, green: 0.13, blue: 0.13, alpha: 0.24)
        self.navigationController?.navigationBar.layer.shadowOpacity = 1
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.navigationController?.navigationBar.layer.shadowRadius = 4
    }
    
    func showAlertMessage(title: String, button: String = "OK") {
          let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
          let ok = UIAlertAction(title: button, style: .cancel)
          alert.addAction(ok)
          present(alert, animated: true)
      }
}

// MARK: - Show and Hide Loader
extension UIViewController {
    
    // MARK: - Loading
    func showLoadingView() {
        let loadingView = UIView(frame: self.view.bounds)
        loadingView.tag = 10001
        loadingView.backgroundColor = .white
        loadingView.alpha = 0.3
        let loadingIndicator = UIActivityIndicatorView(style: .white)
        loadingIndicator.center = loadingView.center
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
        
        loadingView.addSubview(loadingIndicator)
        self.view.addSubview(loadingView)
    }
    
    func hideLoadingView(tableView: UITableView) {
        tableView.separatorColor = .clear//UIColor(rgb: "0x25ac72")
        tableView.refreshControl?.endRefreshing()
        self.view.viewWithTag(10001)?.removeFromSuperview()
    }
}


// MARK: - Show and Hide keyboard
extension BaseViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        DispatchQueue.main.async {
            self.view.endEditing(true)
        }
    }
}
