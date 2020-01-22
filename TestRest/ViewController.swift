//
//  ViewController.swift
//  TestRest
//
//  Created by mobapp01 on 22/01/2020.
//  Copyright © 2020 Ehb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items = [Post]()
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        items = DAO.sharedInstance.getAllPosts()
    }
        
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailsSegue"{
                //welke cell?
                let cell = sender as! UICollectionViewCell
                //waar in tabel stond de cell
                let indexpath = collectionView.indexPath(for: cell)
                //welk post is in cell
                let post = items[indexpath!.item]
                //waar gaan we naartoe
                let detailsVC = segue.destination as! DetailViewController
                //data doorsturen
                detailsVC.detailToShow = post
                
                
            }
        }


}
extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PostCollectionViewCell
        
        let post = items[indexPath.item]
        
        cell.postTitle.text = post.title
        
        return cell
    
        }
    
    
}

