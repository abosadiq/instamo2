//
//  myTableViewCell.swift
//  instamo
//
//  Created by Wafi MoHamed on 3/5/16.
//  Copyright © 2016 wafi. All rights reserved.
//

import UIKit
 import Parse
import DOFavoriteButton

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var labelCell: UILabel!
        
    @IBOutlet weak var userImaGE: UIImageView!
        @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var likeButton:  DOFavoriteButton!
    
    @IBOutlet weak var commentButton: UIButton!
    
    
    @IBOutlet weak var timer: UILabel!
    
    var Like_Button = DOFavoriteButton(frame: CGRectMake(-10, -10, 62, 62), image: UIImage(named: "like-action"))

    var view: UIView!
        var object: PFObject? {
            didSet {
                photo = Photo(object: object!)
                photo.cell = self;
                //let formatter = NSDateFormatter()
                //formatter.dateFormat = "MMM d, hh:mm a"
                //timer.text = formatter.stringFromDate(photo.createdAt!)
                
                Like_Button.addTarget(self, action: Selector("tapped:"), forControlEvents: .TouchUpInside)
                Like_Button.imageColorOn = UIColor(red: 0.9098, green: 0.2314, blue: 0.2078, alpha: 1.0) /* #e83b35 */
                Like_Button.circleColor = UIColor(red: 0.4431, green: 0.1647, blue: 0.4588, alpha: 1.0) /* #712a75 */
                Like_Button.duration = 2.0
                Like_Button.lineColor = UIColor(red: 0.3333, green: 0.6745, blue: 0.9333, alpha: 1.0) /* #55acee */
                self.likeButton!.addSubview(Like_Button)
                
                UserName.text = photo.UserName

                
            }
        } 
    
    
       
    
        var photo: Photo! {
            didSet {
                print("did set caption and image?")
                cellImage.image = photo.image
                userImaGE.image = photo.image
                print("This is the image that is to be set: \(photo.image)")
                labelCell.text = photo.caption
            }
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        override func setSelected(selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            // Configure the view for the selected state
        }
        
    
    
    func tapped(sender: DOFavoriteButton) {
        if sender.selected {
            // deselect
            sender.deselect()
            
            
        }else {
            
            // select with animation
            sender.select()
            
    }
    
    }
}
