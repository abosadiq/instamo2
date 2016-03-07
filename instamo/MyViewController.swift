//
//  MyViewController.swift
//  instamo
//
//  Created by Wafi MoHamed on 3/3/16.
//  Copyright © 2016 wafi. All rights reserved.
//

import UIKit
import Parse

let NotificationLogout = "NotificationLogout"

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onLogOut(sender: AnyObject) {
        PFUser.logOut()
        print("logout")
     self.dismissViewControllerAnimated(true, completion: nil)
       view.endEditing(true)
     //   NSNotificationCenter.defaultCenter().postNotificationName (NotificationLogout, object: nil)

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
