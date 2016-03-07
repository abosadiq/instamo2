//
//  AppDelegate.swift
//  instamo
//
//  Created by Wafi MoHamed on 3/1/16.
//  Copyright © 2016 wafi. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
 let storboard = UIStoryboard(name: "Main", bundle: nil)

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
         window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "userNotificationLogout" , name: NotificationLogout, object: nil)
        Parse.initializeWithConfiguration(
            ParseClientConfiguration(block: { (configuration:ParseMutableClientConfiguration) -> Void in
                configuration.applicationId = "Instagram"
                configuration.clientKey = "ccsf_codepath_216"
                configuration.server = "https://instmo.herokuapp.com/parse"
            })
        )
        
        let current_User = PFUser.currentUser()
        
        if current_User != nil{
            print("hello ")
        
            let vc = storboard.instantiateViewControllerWithIdentifier("LoginViewController")
         window?.rootViewController = vc
        window?.makeKeyAndVisible()
    } else{
        print("nothing found")
            let vc = storboard.instantiateViewControllerWithIdentifier("LoginViewController")
            window?.rootViewController = vc
            window?.makeKeyAndVisible()

    }
        return true
    }
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func userhasLogedOut(){
        let vc = storboard.instantiateViewControllerWithIdentifier("LoginViewController")
        window?.rootViewController = vc
        print("have a nice day ")
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

