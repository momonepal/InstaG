//
//  logInViewController.swift
//  InstaG
//
//  Created by Mohit on 10/24/20.
//  Copyright © 2020 Mohit. All rights reserved.
//

import UIKit
import Parse

class logInViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password:password) {
          (user: PFUser?, error: Error?) in
          if user != nil {
            self.performSegue(withIdentifier: "logInSegue", sender: nil)
          } else {
            print("The login failed.")
          }
        }

        
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "logInSegue", sender: nil)
            } else{
                print("error signing in")
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
