//
//  LoginViewController.swift
//  Test2.swift
//
//  Created by Kevin La on 10/28/20.
//

import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButton(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!

        Auth.auth().signIn(withEmail: email, password: password) { _, error in

            if error != nil {
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
            }
        }
    }
}
