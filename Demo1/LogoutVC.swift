//
//  LogoutVC.swift
//  Demo1
//
//  Created by Hetaksh Ghoghari on 11/22/23.
//

import UIKit
import GoogleSignIn

class LogoutVC: UIViewController {

    
    var UserDetail : UserData = UserData()
    
    @IBOutlet weak var emailAddress: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var btnLogout: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailAddress?.text = UserDetail.userEmail
        self.userName?.text = UserDetail.userName
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.btnLogout.layer.cornerRadius = self.btnLogout.frame.size.height / 2
        })
    
    }
    
    @IBAction func Logout(sender: Any) {
        GIDSignIn.sharedInstance.signOut()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.popToRootViewController(animated: true)//(vc, animated: true)
    }

}
