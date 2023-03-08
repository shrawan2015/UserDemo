//
//  CustomerListViewController.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 05/03/23.
//

import UIKit

// MARK: - CustomerListViewController
class CustomerListViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableViewOutlet: BaseTableView!
    
    // MARK: - Internal Properties
    let viewModel = UserViewModel(interator: UserInteractor())
}

// MARK: - View Life Cycle
extension CustomerListViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - Initial Configuration
extension CustomerListViewController{
    
    private func initialSetup(){
        tableSetup()
        checkStatus()
        fetchUserList()
        navigationViewSeup()
    }
    
    private func tableSetup(){
        tableViewOutlet.register(CustomerTableViewCell.cellNib, forCellReuseIdentifier: CustomerTableViewCell.cellIdentifier)
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
    }
    
    private func navigationViewSeup(){
        self.title = "Users"
        let logoutButton = UIButton(type: .system)
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.tintColor = UIColor.red
        logoutButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        logoutButton.addTarget(self, action: #selector(settingButtonAction), for: UIControl.Event.touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: logoutButton)
    }
   
}

// MARK: - Selectors Methods
extension CustomerListViewController{
    
    @objc func settingButtonAction(_ sender: Any) {
        UserDefaultsHelper.setData(value: false, key: .loginSuccess)
        appDelegate?.setRootViewController(LoginViewController(), animated: true)
    }
    
}

// MARK: - Private Methods
extension CustomerListViewController{
    
    private func checkStatus(){
        switch viewModel.state{
        case .initial , .loading:
            tableViewOutlet.setTableViewEmptyMessage("Loading....")
            //self.showLoadingView()
            print("initial")
        case .loaded:
            tableViewOutlet.restore()
            tableViewOutlet.reloadData()
        case .idle:
            print("Idle state")
        }
    }
    
}

// MARK: - UITableViewDataSource
extension CustomerListViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableViewOutlet.dequeueReusableCell(withIdentifier: CustomerTableViewCell.cellIdentifier, for: indexPath) as! CustomerTableViewCell
        cell.update(viewModel.users[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension CustomerListViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.users[indexPath.row]
        navigateToDetailScreen(user)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

// MARK: - WebService
extension CustomerListViewController{
    
    func fetchUserList(){
        viewModel.fetchData { [weak self] in
            DispatchQueue.main.async {
                self?.checkStatus()
            }
        }
    }
    
}

// MARK: - Navigation
extension CustomerListViewController{
    
    func navigateToDetailScreen(_ user:User){
        let viewController = CusomerDetailViewController()
        viewController.user = user
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

