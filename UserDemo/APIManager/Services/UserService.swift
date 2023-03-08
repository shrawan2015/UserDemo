//
//  UserService.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 05/03/23.
//

import Foundation

protocol UserServiceProtocol{
    func fetchUserList(completion: @escaping ([User]?, Error?) -> Void)
}

// MARK: - UserService
class UserService{

}

// MARK: - UserInteractorProtocol
extension UserService:UserServiceProtocol{
    func fetchUserList(completion: @escaping ([User]?, Error?) -> Void) {
        AFWrapper.sharedInstance.fetchData(using:EndPoint.userList){ data,error in
            guard let data = data else{
                if let error = error{
                    completion(nil, error)
                }
                return
            }
            do {
                let userList = try JSONDecoder().decode([User].self, from: data)
                completion(userList, nil)
            }  catch _ {
                completion(nil, error!)
            }
        }
    }
}
