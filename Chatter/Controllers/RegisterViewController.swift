//
//  RegisterViewController.swift
//  Chatter
//
//  Created by Alexandru Oana on 07.06.2022.
//


import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.textContentType = .username
        emailTextField.keyboardType = .emailAddress
        //passwordTextField.isSecureTextEntry = true
        //passwordTextField.textContentType = .newPassword
        //(enables "cannot suggest strong password due to error: iCloud Keychain is disabled" error)
       
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        let email = emailTextField.text
        let password = passwordTextField.text
        if email?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            password?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            print("Fields are empty")
        } else {
            Auth.auth().createUser(withEmail: email!, password: password!) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    }
}
