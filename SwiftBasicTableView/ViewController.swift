//
//  ViewController.swift
//  SwiftBasicTableView
//
//  Created by guo on 16/4/15.
//  Copyright © 2016年 guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var lb_mealName:   UILabel!
    @IBOutlet weak var txtField_name: UITextField!
    @IBOutlet weak var img_photo:     UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtField_name.delegate = self
    }
    
    // MARK: Actions
    
    @IBAction func btnClick(sender: UIButton) {
        
        txtField_name.text = "Default name"
    }
    
    @IBAction func selectImageFromPhotoLibary(sender: UITapGestureRecognizer) {
        
        txtField_name.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .PhotoLibrary
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        
        lb_mealName.text = textField.text
        textField.text = ""
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        img_photo.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

