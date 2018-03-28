//
//  LoginViewController.swift
//  Shelf
//
//  Created by Raza Qazi on 2018-03-18.
//  Copyright © 2018 Raza Qazi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let db_url = "https://weatherwears.000webhostapp.com/shelf/query.php"
    var user_uid:String = ""
    var user: User? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        self.loginButton.layer.cornerRadius = 10
        self.loginButton.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if self.emailField.text == "" || self.passwordField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and/or password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().signIn(withEmail: self.emailField.text!, password: self.passwordField.text! )  { (user, error) in
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in as: " + (Auth.auth().currentUser?.email)!)
                    self.user_uid = (Auth.auth().currentUser?.uid)!
                    
                    // Retrieve user information from db
                    self.loadUserFromDB() {response in
                        self.user = response
                        
                        //Go to main tab bar interface if login is sucessful and user object is returned
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Shelves") as! ShelfTabBarViewController
                        vc.setUser(self.user!)
                        self.present(vc, animated: true, completion: nil)
                    }
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       super.prepare(for: segue, sender: sender)

    }
    
    // Loads user properties from server using a POST request - Returns a User object
    func loadUserFromDB(completion: @escaping (_ result: User) -> Void) {
        var newUser: User? = nil
        
        let param: Parameters = [
            "queryType": "get_user_details",
            "user_id": self.user_uid
        ]
        
        // Send a POST request using params from above
        Alamofire.request(db_url, method: .post, parameters: param).validate().responseJSON { response in
            switch response.result {
            case .success(let requestResponse):
                let responseJSON = JSON(requestResponse)
                for (_,subJson):(String, JSON) in responseJSON {
                    let temp = subJson.dictionary!
                    newUser = User(temp["user_id"]!.string!, temp["email_address"]!.string!, temp["first_name"]!.string!, temp["last_name"]!.string!)
                }
                completion(newUser!)
            case .failure(let error):
                print("JSON request error: ", error)
            }
        }
    }
}
