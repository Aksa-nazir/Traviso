//
//  LoginViewController.swift
//  Traviso
//
//  Created by aksa nazir on 15/03/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
        
    }
    
    func setUpElements()  {
        
        //Hide the error label
        ErrorLabel.alpha = 0
        
        //Style the elements
        
        Utilities.styleTextField(EmailTextField)
        Utilities.styleTextField(PasswordTextField)
        //Utilities.styleFilledButton(LoginButton)
    }
    
    
    @IBAction func LoginTapped(_ sender: Any) {
        
        // TODO: Validate Text Fields
        func validateFields() -> String? {
            
            // Check that all fields are filled in
            if  EmailTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" ||
                PasswordTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) == ""
            {
                return "Please fill in all fields."
            }
            
            return nil
        }
        // Create cleaned versions of the text field
        let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.ErrorLabel.text = error!.localizedDescription
                self.ErrorLabel.alpha = 1
            }
            else {
                let hometabViewcontroller = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.hometabViewcontroller) as? hometabViewController
                
                self.view.window?.rootViewController = hometabViewcontroller
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
}


    


