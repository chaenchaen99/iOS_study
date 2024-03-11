//
//  ViewController.swift
//  KTV
//
//  Created by hyeonggyu.kim on 2023/09/06.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var imageIconView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginButton.layer.cornerRadius = 19
        self.loginButton.layer.borderColor = UIColor(named: "main-brown")?.cgColor
        self.loginButton.layer.borderWidth = 1
    }


    @IBAction func loginButtonDidTap(_ sender: Any) {
        //현재 루트 뷰 컨트롤러를 새로운 컨트롤러로 교체
        self.view.window?.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "tabbar");
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }
}

