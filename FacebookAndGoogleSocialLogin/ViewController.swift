//
//  ViewController.swift
//  FacebookAndGoogleSocialLogin
//
//  Created by pratiksha jagtap on 6/13/23.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn
import Firebase
class ViewController: UIViewController {

    @IBOutlet weak var btnFacebook: FBLoginButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        facebookLogin()
    }
    @IBAction func btnGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }

            // If sign in succeeded, display the app's main content View.
          }

    }
    func facebookLogin(){
        if let token = AccessToken.current,
               !token.isExpired {
               // User is logged in, do work such as go to next view controller.
        }else{
            btnFacebook.permissions = ["public_profile", "email"]
            btnFacebook.delegate = self
              }
    }

}
extension ViewController: LoginButtonDelegate{
    func loginButton(_ loginButton: FBSDKLoginKit.FBLoginButton, didCompleteWith result: FBSDKLoginKit.LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: token,version: nil, httpMethod: .get)
        request.start()
                         
}
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginKit.FBLoginButton) {
        print("Logout")
    }
    
    
}
