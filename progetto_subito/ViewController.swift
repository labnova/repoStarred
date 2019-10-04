//
//  ViewController.swift
//  progetto_subito
//
//  Created by Innocenzo Tremamondo on 04/10/2019.
//  Copyright © 2019 Innocenzo Tremamondo. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
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
        
        AF.request(url).responseJSON { response in
            print("REQUEST:", response.request)
            print("RESPONSE:", response.response)
            print("RESULT:", response.result)
            
            
        }
        
        
    }


}

