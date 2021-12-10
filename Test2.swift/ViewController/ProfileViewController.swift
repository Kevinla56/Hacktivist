//
//  ProfileViewController.swift
//  Test2.swift
//
//  Created by Kevin La on 11/11/20.
//

import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {}

    @IBAction func logoutButton(_ sender: Any) {
        transitionToMainScreen()
    }

    func transitionToMainScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavigationController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavigationController)
    }
}
