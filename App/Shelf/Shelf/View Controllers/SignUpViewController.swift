//
//  SignUpViewController.swift
//  Shelf
//
//  Created by Raza Qazi on 2018-03-18.
//  Copyright © 2018 Raza Qazi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        self.signupButton.layer.cornerRadius = 10
        self.signupButton.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signupButtonPressed(_ sender: UIButton) {
        if self.emailField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: self.emailField.text!, password: self.passwordField.text!) { (user, error) in
                if error == nil {
                    print("You have successfully signed up")
                    // add user to database
                    if let user_session = Auth.auth().currentUser {
                        let ref = Database.database().reference()
                        ref.child("users").child(user_session.uid).setValue([
                            "email":"\(user_session.email!)",
                            "firstname":"\(self.firstNameField.text!)",
                            "lastname":"\(self.lastNameField.text!)"
                            ])
                    }
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Shelves")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}

