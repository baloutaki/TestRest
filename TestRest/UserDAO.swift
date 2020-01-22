//
//  UserDAO.swift
//  TestRest
//
//  Created by mobapp01 on 22/01/2020.
//  Copyright © 2020 Ehb. All rights reserved.
//

import Foundation

class UserDAO{
    
    
    //singleton
    static var sharedInstance:UserDAO = UserDAO.init()
    
    private init(){}
    
    func getDetaialPost() -> [Post]{
        var detail =
        let url = URL.init(string: "https://jsonplaceholder.typicode.com/users")
        
        do{
            //ruwe data uit adres halen
            let data = try Data.init(contentsOf: url!)
            //root element was een array
            let jsonArray = try JSONSerialization.jsonObject(with: data) as! [NSObject]
            
            for item in jsonArray{
                let id = item.value(forKey: "Id") as! Int
                let name = .value(forKey: "name") as! String
                let body = item.value(forKey: "body") as! String
                
                let post = Post.init(userID: userID, id: id, title: title, body: body)
                posts.append(post)
            }
            
        }catch{
            print("kapot")
        }
        return posts
    
}
