//
//  ViewController.swift
//  googleSignInDemo
//
//  Created by Neha Gupta on 24/02/21.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {

    @IBOutlet weak var btnGoogleSign: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    @IBAction func onGoogleSignIn(_ sender: Any){
        
        GIDSignIn.sharedInstance()?.signIn()
    }


}

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
                
            } else {
                print("\(error.localizedDescription)")
                
            }
            return
            
        }
        // Perform any operations on signed in user here.
        let userId = user.userID                  // For client-side use only!
        print("Google User Id:\(String(describing: userId))")
        let idToken = user.authentication.idToken // Safe to send to the server
        print("Login Token:\(String(describing: idToken))")
        let fullName = user.profile.name
        print("Full Name: \(String(describing: fullName))")
        _ = user.profile.givenName
        _ = user.profile.familyName
        _ = user.profile.email
    }
    
    
}
