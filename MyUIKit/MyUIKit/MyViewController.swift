//
//  MyViewController.swift
//  MyUIKit
//
//  Created by admin on 2024/01/10.
//

import UIKit

protocol AdminDelegate {
    func doTask() //위임이 되면 이런것들을 해야해
}

class MyViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var helloLabel: UILabel!
    var admin: Admin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        admin = Admin(delegate: self) //위임을 누구한테 ? 자기자신에게 위임을 줌
    }

    @IBAction func didTabButton(_ sender: Any) {
        if let name = nameTextField.text {
            helloLabel.text = "Hello \(name)!!"
        }
        admin?.delegate.doTask()
    }
}

extension MyViewController: AdminDelegate { //MyViewController가 위임받았고, 나 위임받으면 어떻게 할거야가 아래 코딩되어있다.
    func doTask() {
        print("저 지금 일 열심히 하고 있습니다!")
    }
}

struct Admin { // 나는 관리자야
    var delegate : AdminDelegate // 나는 위임을 할 준비가 되어있어
}
