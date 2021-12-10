//
//  InfoViewController.swift
//  Test2.swift
//
//  Created by Kevin La on 10/28/20.
//

import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import UIKit

class InfoViewController: UIViewController {
    @IBOutlet var firstnameTextField: UITextField!
    @IBOutlet var lastnameTextField: UITextField!
    @IBOutlet var studyTextField: UITextField!
    @IBOutlet var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func fieldCheck() -> String? {
        if firstnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || studyTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill all required fields"
        }
        return nil
    }

    @IBAction func InfoButton(_ sender: Any) {
        let firstname = firstnameTextField.text!
        let lastname = lastnameTextField.text!
        let study = studyTextField.text!

        let error = fieldCheck()

        if error != nil {
            errorMessage(error!)
        } else {
            var ref: DatabaseReference!

            ref = Database.database().reference()

            ref?.child("info").childByAutoId().setValue(
                ["firstname": firstname,
                 "lastname": lastname,
                 "study": study])

            transitionToMainScreen()
        }
    }

    func errorMessage(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }

    func transitionToMainScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
}
