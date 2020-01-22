//
//  DAO.swift
//  TestRest
//
//  Created by mobapp01 on 22/01/2020.
//  Copyright © 2020 Ehb. All rights reserved.
//

import Foundation

class DAO{
    
    //singleton
    static var sharedInstance:DAO = DAO.init()
    
    private init(){}
    
    func getAllPosts() -> [Post]{
        var posts = [Post]()
        let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts")
        
        do{
            //ruwe data uit adres halen
            let data = try Data.init(contentsOf: url!)
            //root element was een array
            let jsonArray = try JSONSerialization.jsonObject(with: data) as! [NSObject]
            
            for item in jsonArray{
                let userID = item.value(forKey: "userId") as! Int
                let id = item.value(forKey: "id") as! Int
                let title = item.value(forKey: "title") as! String
                let body = item.value(forKey: "body") as! String
                
                let post = Post.init(userID: userID, id: id, title: title, body: body)
                posts.append(post)
            }
            
        }catch{
            print("kapot")
        }
        return posts
        
    }
    
    func getUser(userId: Int) -> User {
        var user:User?
        let url = URL.init(string: "https://jsonplaceholder.typicode.com/users/\(userId)")
     
                do {
           //ruwe data uit adres halen
           let data = try Data.init(contentsOf: url!)
           //root element is een object
           let jsonData = try JSONSerialization.jsonObject(with: data) as! NSObject
                    
                    let userName = jsonData.value(forKey: "username") as! String
           let user = User.init(userID: userId, name: userName)
                    return user 
                 
        }catch{
            print("not working")
        }
        return User.init(userID: -404, name: "Not found")

   }
}
        
        
        
        
    
