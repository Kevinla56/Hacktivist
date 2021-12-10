//
//  SignupViewController.swift
//  Test2.swift
//
//  Created by Kevin La on 10/15/20.
//

import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func signupButt(_ sender: Any) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if error != nil {
                self.errorMessage("Please fill all the fields")
            } else {
                self.transitionToSetup()
            }
        }
    }

    func errorMessage(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }

    func transitionToSetup() {
        let infoViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.infoViewController) as? InfoViewController

        view.window?.rootViewController = infoViewController
        view.window?.makeKeyAndVisible()
    }
}
