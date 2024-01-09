//
//  ViewController.swift
//  MyUIKit
//
//  Created by admin on 2024/01/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad() //스토리보드에 있는거 다 그렸다
        //이후 다음 내용 호출
        //스토리보드에 기본적인 내용을 그려놓고, 그것들을 조종할 때 이 부분에 내용을 작성
        view.backgroundColor = .green //UIColor타입 != Color타입
    }

    @IBAction func didMyButtonTapped(_ sender: Any) {
        print("Hello Chaeyeon!!!!")
        myLabel.text = "Hello UIKit"
    }
    
}

