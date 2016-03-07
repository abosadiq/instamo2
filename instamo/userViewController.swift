//
//  userViewController.swift
//  instamo
//
//  Created by Wafi MoHamed on 3/2/16.
//  Copyright © 2016 wafi. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class userViewController: UIViewController, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    
    var currentViewController: UIViewController?
    
    
    @IBOutlet weak var CaptionTextField: UITextField!
     var image = UIImage()
      @IBOutlet weak var image_view: UIImageView!
     let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // saveTheImage(image)

     
        imagePicker.delegate = self
        //98CaptionTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    @IBAction func fromCamera(sender: AnyObject) {
        
        let picker_2 = UIImagePickerController()
        
        picker_2.delegate = self
        picker_2.sourceType = .Camera
        
        presentViewController(picker_2, animated: true, completion: nil)
        

    }
    
     
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onclick(sender: AnyObject) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        saveTheImage(image)

        presentViewController(picker, animated: true, completion: nil)

    }
    
    
    func saveTheImage(image:UIImage?){
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let firstPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        _ = info[UIImagePickerControllerOriginalImage] as! UIImage
        image = firstPhoto
      //image_view.image = info[UdIImagePickerControllerOriginalImage] as? UIImage
        saveTheImage(image)
        dismissViewControllerAnimated(true, completion: nil)
        self.image_view.image = image
    }
    
    func imagePickerController_2(picker_2: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let firstPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        _ = info[UIImagePickerControllerOriginalImage] as! UIImage
        image = firstPhoto
        //image_view.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        saveTheImage(image)
        dismissViewControllerAnimated(true, completion: nil)
        self.image_view.image = image
    }
    
    @IBAction func onSave(sender: AnyObject) {
        let newImage = Post.resize(image, newSize: CGSize(width: 300, height: 500))
        Post.postUserImage(newImage, withCaption: CaptionTextField.text) { (success: Bool, error: NSError?) -> Void in
            
            if success {
                print("good")
                self.image_view.image = nil
                self.CaptionTextField.text = nil
                
            } else {
                print("Sorry! Error")
            }
            
            self.tabBarController?.selectedIndex = 0
            
        }
          self.tabBarController?.selectedIndex = 0
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func OnTap(sender: AnyObject) {
        
     view.endEditing(true)
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
