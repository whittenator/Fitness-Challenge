//
//  CreateProfileVC.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/13/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class CreateProfileVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate{
    
    var list = ["Male", "Female"]
    
    
    @IBOutlet var userNameTF: UITextField!
    
    @IBOutlet var genderTF: UITextField!
    @IBOutlet var genderPicker: UIPickerView!
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var heightTF: UITextField!
    
    @IBOutlet weak var profilePhoto: UIImageView!
    
    @IBAction func selectProfilePhoto(_ sender: Any) {
        
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil)
    }
    @IBAction func goToMain(_ sender: Any) {
        if let gender = genderTF.text, let username = userNameTF.text, (gender == "male" || gender == "female" && username.characters.count > 0){
        
        performSegue(withIdentifier: "goToMain", sender: nil)
        } else {
            let alert = UIAlertController(title: "Username and Gender Required", message: "You must enter a valid username and gender(male or female)!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        genderTF.delegate = self
        userNameTF.delegate = self
        weightTF.delegate = self
        heightTF.delegate = self
        ageTF.delegate = self

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CreateProfileVC.dismissKeyboard)))
        
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        genderTF.resignFirstResponder()
        userNameTF.resignFirstResponder()
        weightTF.resignFirstResponder()
        heightTF.resignFirstResponder()
        ageTF.resignFirstResponder()
        
        return true
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        profilePhoto.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    

}
