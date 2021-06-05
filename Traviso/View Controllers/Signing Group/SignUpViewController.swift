//
//  SignUpViewController.swift
//  Traviso
//
//  Created by aksa nazir on 15/03/21.
//

import UIKit
import FirebaseAuth
import Firebase
import SwiftUI

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    func setUpElements() {
    
        
        ErrorLabel.alpha = 0
    
        // Style the elements
        Utilities.styleTextField(FirstNameTextField)
        Utilities.styleTextField(LastNameTextField)
        Utilities.styleTextField(EmailTextField)
        Utilities.styleTextField(PasswordTextField)
        //Utilities.styleFilledButton(SignUpButton)
    }
    
   
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if  FirstNameTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" ||
            LastNameTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" ||
            EmailTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" ||
            PasswordTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) == ""
        {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = PasswordTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    
    
    @IBAction func SignUpTapped(_ sender: Any) {
        
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
           showError(error!)
        }
         else {
             
             // Create cleaned versions of the data
             let firstName = FirstNameTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
             let lastName = LastNameTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
             let email = EmailTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
             let password = PasswordTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
             
             // Create the user
            
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstame": firstName, "lastname": lastName, "uid": authResult!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    // Transition to the home screen
                    self.transitionToHome()
                }
            }
        }
    }
    
    
    func showError(_ message:String) {
        
        ErrorLabel.text = message
        ErrorLabel.alpha = 1
    }
    func transitionToHome() {
        
            let hometabViewcontroller = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.hometabViewcontroller) as? hometabViewController
            view.window?.rootViewController = hometabViewcontroller
            view.window?.makeKeyAndVisible()
    }
    
}



