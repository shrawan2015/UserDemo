//
//  APIService.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 06/03/23.
//

import Foundation
import Alamofire

protocol NetworkCall {
    func fetchData(using request: String,completion: @escaping (Data?, Error?) -> Void)
}

class AFWrapper: NetworkCall {
     static let sharedInstance = AFWrapper()
    let baseURLString = EndPoint.websiteURL
    
    func fetchData(using request: String,completion: @escaping (Data?, Error?) -> Void){
        let urlStr = "\(baseURLString)/\(request)"
        AF.request(urlStr).response { (response) in
            completion(response.data, response.error)
        }
    }
}
