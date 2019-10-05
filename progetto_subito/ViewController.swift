//
//  ViewController.swift
//  progetto_subito
//
//  Created by Innocenzo Tremamondo on 04/10/2019.
//  Copyright © 2019 Innocenzo Tremamondo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var followerRepo: [User] = []
    
    @IBOutlet weak var author: UITextField!
    @IBOutlet weak var repo: UITextField!
    
    @IBAction func activeButton() {
        
        if(author.text != nil && repo.text != nil) {
            downloadStarred(author: author.text!, repo: repo.text!);
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    
    
    
    func downloadStarred(author: String, repo: String) -> Void {
       var url = "https://api.github.com/repos/"+author+"/"+repo+"/stargazers"
        
        AF.request(url).responseData { response in
            
            switch response.result {
            case .success:
                
                let json = try? JSON(data:response.data!)
                for (index,subJson):(String, JSON) in json! {
                    var avatar = subJson["avatar_url"].stringValue;
                    var login = subJson["login"].stringValue;
                    var user = User(avatar: avatar, name: login)
                    self.followerRepo.append(user);
                    
                }
                
              self.performSegue(withIdentifier: "listStarredUser", sender: nil)
              case .failure(let error):
                print("Request failed with error: \(error)")
            }
            
            
            
          
            
        }
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listStarredUser" {
            let vc = segue.destination as? TableViewController
            vc!.numeroUtenti = self.followerRepo
        }
    }


}

class User {
    var avatar: String
    var name: String
    init(avatar: String, name: String) {
        self.avatar = avatar
        self.name = name
    }
}
