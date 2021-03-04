//
//  APIService.swift
//  Test Task Catch Cashback
//
//  Created by Dmitry Sachkov on 03.03.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIService {
    
    let urlString = "https://jsonplaceholder.typicode.com/photos"
    
    var dataArray = [DataModel]()
    
    func getData() -> [DataModel] {
        
        guard let url = URL(string: urlString) else { return [DataModel]() }
        
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let data = JSON(value)
                
                DispatchQueue.main.async {
                    for i in data {
                        let id = i.1["id"].intValue
                        let albumID = i.1["albumID"].intValue
                        let title = i.1["title"].stringValue
                        let url = i.1["url"].stringValue
                        let thumbnailURL = i.1["thumbnailURL"].stringValue
                        self.dataArray.append(DataModel(albumID: albumID, id: id, title: title, url: url, thumbnailURL: thumbnailURL))
                        
                        print(self.dataArray)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        return dataArray
    }
}
