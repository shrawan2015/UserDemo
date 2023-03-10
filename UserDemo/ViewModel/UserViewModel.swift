//
//  UserViewModel.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 05/03/23.
//

import Foundation

enum ViewState{
    case initial
    case loading
    case loaded
    case idle
}

class UserViewModel{
    var users: [User] = []
    var error: Error?
    var state:ViewState = .initial
    private let service:UserServiceProtocol?
   
    init(service: UserServiceProtocol?) {
        self.service = service
    }
}

extension UserViewModel{
    func fetchData(completion: @escaping () -> Void){
        state = .loading
        self.service?.fetchUserList{ [weak self] (users, error) in
            self?.state = .loaded
            self?.error = error
            self?.users = users ?? []
            completion()
        }
    }
}


