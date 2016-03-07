//
//  Photo.swift
// instamo
//
//  Created by Wafi MoHamed on 3/1/16.
//  Copyright © 2016 wafi. All rights reserved.
//

import UIKit
import Parse
import ParseUI
let imageDataSetNotification = "imageDataSet";

class Photo: NSObject {
    
    var image: UIImage?
    var author: PFUser?
    var caption: String?
    var likesCount: Int?
    var commentsCount: Int?
    var UserName: String?
    var cell: myTableViewCell?
      var PostedTime: String?
    var createdAt: NSDate?

    
    init(object : PFObject) {
        
        super.init()
        
        // Create Parse object PFObject
        let newObject = object
        
        print("Get details of photo from object")
        // Add relevant fields to the object
        //  author = newObject["author"] as! String
        caption = newObject["caption"] as? String
        likesCount = newObject["likesCount"] as? Int
        commentsCount = newObject["commentsCount"] as? Int
       //PostedTime = newObject["PostedTime"] as? String

        UserName = newObject["UserName"] as? String
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        //let createdAt = formatter.dateFromString(PostedTime!)!
     // PostedTime = "\(String(Int(NSDate().timeIntervalSinceDate(createdAt))))" as String
        
        if let newImage = object.valueForKey("media")! as? PFFile {
            
            newImage.getDataInBackgroundWithBlock({ (imageData: NSData?, error: NSError?) -> Void in
                if (error == nil) {
                    print("Image data found")
                    let image = UIImage(data: imageData!)
                    print(image)
                    self.image = image
                    self.cell?.photo = self;
                    NSNotificationCenter.defaultCenter().postNotificationName(imageDataSetNotification, object: nil)
                } else {
                    print("could not get image \(error?.localizedDescription)")
                }
                }, progressBlock: { (int: Int32) -> Void in
                   
            })
        }
    }
    
    
}
