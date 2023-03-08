//
//  BaseTableView.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 07/03/23.
//

import Foundation
import UIKit

// MARK: - View Life Cycle
final class BaseTableView: UITableView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    convenience init(style: UITableView.Style = .plain) {
        self.init(frame: .zero, style: style)
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupView()
    }
}

// MARK: - Initial Configuration
extension BaseTableView{
   
    final func setupView() {
        setUpTableView()
    }
    
    final func  setUpTableView(){
        backgroundColor = .white
        separatorStyle = .none
        keyboardDismissMode = .onDrag
        tableFooterView = UIView()
    }
}


// MARK: - Public Methods Loader
extension BaseTableView{
   
    final func  showLoaderScreen(){
        tableViewInteraction(false)
    }
    
    final func  stopLoaderScreen(){
        tableViewInteraction(true)
    }
    
    final func tableViewInteraction(_ isStarted:Bool){
        DispatchQueue.main.async {
            self.isUserInteractionEnabled = isStarted
            self.reloadData()
        }
    }
}


// MARK: - Public Methods Emoty screen
extension UITableView {
    
    // TODO: Need to refactor this method altogether
    func setTableViewEmptyMessage(_ message: String) {
        let emptyView = UIView(frame: CGRect(x: 0, y:  5, width: self.bounds.size.width, height: 40))
        emptyView.backgroundColor = .white
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.lightGray
        emptyView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: emptyView.topAnchor , constant: 0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        titleLabel.text = message
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .none
    }
}


