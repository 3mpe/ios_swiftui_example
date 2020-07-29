//
//  Api.swift
//  NativeSimpleProject
//
//  Created by Neyasis on 17.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

import Foundation
import Alamofire

struct ApiService {
    public static var Instance = ApiService();
    private var ApiURL: String = ApiConfig.BaseURL;
    
    
    public func get(_ url: String, parameters: Parameters? = nil, completion: @escaping (Any) -> Void) {
        let uri = ApiURL + url;
        AF.request(uri, method: .get, parameters: parameters).responseData { response in
            completion(response.data as Any)
        }
    }
    
    public func post(_ url: String, parameters: Parameters? = nil, completion: @escaping (Any) -> Void) {
       let uri = ApiURL + url;
       AF.request(uri, method: .post, parameters: parameters).responseJSON { response in
           completion(response.data as Any)
       }
    }
    
    
   public func put(_ url: String, parameters: Parameters? = nil, completion: @escaping (Any) -> Void) {
      let uri = ApiURL + url;
      AF.request(uri, method: .put, parameters: parameters).responseJSON { response in
          completion(response.data as Any)
      }
   }
    
    
}
