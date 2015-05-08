//
//  PhotosViewController.swift
//  InstagramFeed
//
//  Created by Neha Sharma on 5/6/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var instaJSON: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var clientId = "fc7ba99f1a574e1da3d4702e51dcb768"
        
        var url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")!
        var request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSDictionary
            self.instaJSON = responseDictionary["data"] as! NSArray?
            self.tableView.reloadData()
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let photos = instaJSON {
            return photos.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("InstaCell", forIndexPath: indexPath) as! InstaCell
        
        let json = instaJSON![indexPath.row] as! NSDictionary
        let user = json["user"] as! NSDictionary
        let images = json["images"] as! NSDictionary
        
        cell.userName.text = user["username"] as? String
        
        let profileURL = NSURL(string: json.valueForKeyPath("user.profile_picture") as! String)!
        let instaURL = NSURL(string: json.valueForKeyPath("images.standard_resolution.url") as! String)!
        
        cell.profileImage.setImageWithURL(profileURL)
        cell.instaImage.setImageWithURL(instaURL)
        
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPathForCell(cell)
        
        let json = instaJSON![indexPath!.row] as! NSDictionary
        
        let detailViewController = segue.destinationViewController as! DetailViewController
        
        detailViewController.json = json
    }

}
