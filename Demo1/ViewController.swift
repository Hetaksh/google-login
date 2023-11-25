//
//  ViewController.swift
//  Demo1
//
//  Created by Hetaksh Ghoghari on 11/22/23.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
    
    @IBOutlet weak var btnGoolgeLogin: UIButton!
    
    var ViewModel : ViewControllerVM = ViewControllerVM()
    
    var userData : UserData = UserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.btnGoolgeLogin.layer.cornerRadius = self.btnGoolgeLogin.frame.size.height / 2
        })
    
    }
    
    @IBAction func signIn(sender: Any) {
        //      GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
        //        guard error == nil else { return }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            guard let signInResult = signInResult else { return }
            
            let user = signInResult.user
            
            let emailAddress = user.profile?.email
            
            let name = user.profile?.name
            if emailAddress?.isEmpty != nil && name?.isEmpty != nil
            {
                self.userData.userEmail = emailAddress!
                self.userData.userName = name!
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Images_Pagging_VC") as! Images_Pagging_VC
                vc.UserInfo = self.userData
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else
            {
                
            }
            
        }
        
    }
}

class UserData
{
    
    var userEmail = String()
    var userName = String()
    internal init(userEmail: String = String(), userName: String = String()) {
        self.userEmail = userEmail
        self.userName = userName
    }
}

struct ScreenSize {
    static var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    static var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    static var heightAspectRatio: CGFloat {
        return UIScreen.main.bounds.size.height / 812
    }
    
    static var widthAspectRatio: CGFloat {
        return UIScreen.main.bounds.size.width / 375
    }
    
    static var fontAspectRatio : CGFloat {
        if UIDevice().userInterfaceIdiom == .pad {
            return UIScreen.main.bounds.size.height / 667
        }
        
        let size = UIScreen.main.bounds.size
        
        if size.width < size.height {//Potrait
            return UIScreen.main.bounds.size.width / 375
            
        } else {//Landscape
            return UIScreen.main.bounds.size.height / 375
        }
    }
    
    static var cornerRadious: CGFloat {
        return 10
    }
}
