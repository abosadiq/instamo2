//
//  LoginViewController.swift
//  instamo
//
//  Created by Wafi MoHamed on 3/1/16.
//  Copyright © 2016 wafi. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import SwiftyButton
import ButtonBackgroundColor

class LoginViewController: UIViewController {
    
    @IBOutlet weak var sign_In: UIButton!
    @IBOutlet weak var sign_Up: UIButton!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var UserTextField: UITextField!
    //let myButton:UIButton = UIButton(type:.Custom)
    
    @IBOutlet weak var instaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sign_In.bbc_backgroundColorNormal(UIColor.whiteColor(), backgroundColorSelected: UIColor.blueColor())
       // sign_Up.bbc_backgroundColorNormal(UIColor.whiteColor(), backgroundColorSelected: UIColor.redColor())
       //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "iphoneImage.png")!)
       generateRandomColor()
//        sign_In.layer.borderColor = UIColor.blueColor() .CGColor
//        sign_In.layer.borderWidth = 1
//        sign_In.layer.cornerRadius = 8
//        
//        sign_Up.layer.borderColor = UIColor.redColor() .CGColor
//        sign_Up.layer.borderWidth = 1
//        sign_Up.layer.cornerRadius = 8
//        
      
        
        UIView.animateWithDuration(2, delay: 0.0, options:[UIViewAnimationOptions.Repeat, UIViewAnimationOptions.Autoreverse], animations: {
            self.view.backgroundColor = UIColor.blackColor()
            self.view.backgroundColor = UIColor.greenColor()
            self.view.backgroundColor = UIColor.grayColor()
            self.view.backgroundColor = UIColor.redColor()
            }, completion: nil)
        instaLabel.textColor = UIColor.whiteColor()
     // instaLabel.font = UIFont (name: "proxima Nova", size: 100)

        UIView.animateWithDuration(4, delay: 1, options:[UIViewAnimationOptions.AllowUserInteraction,UIViewAnimationOptions.Repeat,UIViewAnimationOptions.Autoreverse], animations: {
            self.view.backgroundColor = self.generateRandomColor()
            self.view.backgroundColor = self.generateRandomColor()
            

            
            }, completion:nil )
        


        
    }
    @IBAction func omTap(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        view.endEditing(true)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func onSignIn(sender: AnyObject) {
        
        
        sign_In.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        
        PFUser.logInWithUsernameInBackground(UserTextField.text!, password: passwordField.text!) { (user: PFUser?,error: NSError?) -> Void in
            if user != nil{
                print("you're logged in")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
    }
    
    
    @IBAction func onSignUp(sender: AnyObject) {
        sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        
        let user = PFUser()
        
        user.username = UserTextField.text
        user.password = passwordField.text
        
        user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success {
                print("new user ")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            } else {
                print("ERROR: " + (error?.localizedDescription)!)
            }
        }
       
        
        
        
        
    }
    
//       func randomColor() -> UIColor {
//        let Red:CGFloat = CGFloat(drand48())
//        let Green:CGFloat = CGFloat(drand48())
//        let Blue:CGFloat = CGFloat(drand48())
//       
//        return UIColor(red: Red, green: Green, blue: Blue, alpha: 1.0)
//    }
//
//   
    
    func generateRandomColor() -> UIColor {
        let blue : CGFloat = CGFloat(arc4random() % 425) / 276 // use 256 to get full range from 0.0 to 1.0
        let green : CGFloat = CGFloat(arc4random() % 410) / 276 + 0.5 // from 0.5 to 1.0 to stay away from white
        let red : CGFloat = CGFloat(arc4random() % 212) / 276 + 0.5 // from 0.5 to 1.0 to stay away from black
        
        return UIColor(hue: blue, saturation: green, brightness: red, alpha: 1)
    }
    
    override func viewDidAppear(animated: Bool) {
        generateRandomColor()
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
