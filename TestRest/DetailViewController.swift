//
//  DetailViewController.swift
//  TestRest
//
//  Created by mobapp01 on 22/01/2020.
//  Copyright © 2020 Ehb. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleTF: UILabel!
    @IBOutlet weak var userNameTF: UILabel!
    @IBOutlet weak var bodyTV: UITextView!
    
    var detailToShow:Post?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        if let post = detailToShow{
                let user = DAO.sharedInstance.getUser(userId:post.userID)
            
                  titleTF.text = post.title
                  userNameTF.text = user.name
                  bodyTV.text = post.body
              }
       
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
