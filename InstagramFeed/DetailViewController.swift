//
//  DetailViewController.swift
//  InstagramFeed
//
//  Created by Neha Sharma on 5/6/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var instaImage: UIImageView!
    
    var json: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let user = json["user"] as! NSDictionary
        let images = json["images"] as! NSDictionary
        
        let profileURL = NSURL(string: json.valueForKeyPath("user.profile_picture") as! String)!
        let instaURL = NSURL(string: json.valueForKeyPath("images.standard_resolution.url") as! String)!
        
        profileImage.setImageWithURL(instaURL)
        instaImage.setImageWithURL(instaURL)
        userName.text = user["username"] as? String
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
