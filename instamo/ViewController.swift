//
//  ViewController.swift
//  instamo
//
//  Created by Wafi MoHamed on 3/1/16.
//  Copyright © 2016 wafi. All rights reserved.
//

import UIKit
import Parse
import DOFavoriteButton


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

@IBOutlet weak var tableView: UITableView!
    
   
     var refrechController: UIRefreshControl!
    
    var photos: [PFObject]?
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        gettingIfo()
        // construct PFQuery and get data from Parse
        self.refresher_contorl()
        
        tableView.reloadData()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        gettingIfo()
        self.refrechController.endRefreshing()

        

    }
    func gettingIfo(){
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                // print(posts)
                self.photos = posts
                self.tableView.reloadData()
            } else {
                print("ERROR: unable to get photos from parse")
            }
        }
        
        tableView.reloadData()
    }
    

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myTableViewCell", forIndexPath: indexPath) as!
      myTableViewCell
        
        if (photos != nil) {
            let object = photos![indexPath.row]
            
            cell.object = object
            
        }
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func  refresher_contorl(){
        self.refrechController = UIRefreshControl()
        let label:NSAttributedString = NSAttributedString(string: "Pull me to refresh")
        refrechController.attributedTitle = label
        
        self.refrechController.addTarget(self,action: "refresher:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refrechController)
        refrechController.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        refrechController.tintColor = UIColor(red: 155/255, green: 155/55, blue: 154/25, alpha: 1)
        
        
    }
    func refresher(sender:AnyObject){
        
        self.tableView.reloadData()
        //networker_Request()
        self.refrechController.endRefreshing()
         gettingIfo()
        
    }


    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
        
    }
    

