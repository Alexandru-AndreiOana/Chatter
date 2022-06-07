//
//  LoginViewController.swift
//  Chatter
//
//  Created by Alexandru Oana on 07.06.2022.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
      

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextfield.textContentType = .username
        emailTextfield.keyboardType = .emailAddress
        passwordTextfield.isSecureTextEntry = true
        //passwordTextfield.textContentType = .newPassword
        
       
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        let email = emailTextfield.text
        let password = passwordTextfield.text
        if email?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            password?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            print("Fields are empty")
        } else {
            Auth.auth().signIn(withEmail: email!, password: password!) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
        }
        }
    }
}
