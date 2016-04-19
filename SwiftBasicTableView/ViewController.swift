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
    @IBOutlet weak var v_rating:      RatingControl!
    @IBOutlet weak var barBtn_save:   UIBarButtonItem!
    
    var meal : Meal?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtField_name.delegate = self
        
        if let meal = meal {
            navigationItem.title = meal.name
            txtField_name.text   = meal.name
            img_photo.image      = meal.photo
            v_rating.rating      = meal.rating
        }
        
        checkValidMealName()
    }
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //（===）whether two object references both refer to the same object instance
        if barBtn_save === sender {
            
            let name   = txtField_name.text ?? ""
            let photo  = img_photo.image
            let rating = v_rating.rating
            
            meal = Meal(name: name, photo: photo, rating: rating)
        }
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
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        if isPresentingInAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    func checkValidMealName() {
        
        let text = txtField_name.text ?? ""
        barBtn_save.enabled = !text.isEmpty
    }
    
    // MARK: Delegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        barBtn_save.enabled = false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        
        //lb_mealName.text = textField.text
        //textField.text = ""
        checkValidMealName()
        navigationItem.title = textField.text
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

