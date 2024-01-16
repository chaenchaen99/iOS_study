//
//  MyTableViewController.swift
//  MyUIKit
//
//  Created by admin on 2024/01/12.
//

import UIKit


class MyTableViewController: UIViewController {

    @IBOutlet var myTableView: UITableView!
    
    let cellData = ["Hello TableView!","This is UIKit","Welcome!","My name is","Chaeyeon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
//datasource - 이 테이블 뷰가 어떤 데이터로 어떻게 그려질 것인지
//viewdelegate - 좀 더 액션 메서드에 가깝다
extension MyTableViewController:
    UITableViewDelegate,
    UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = cellData[indexPath.row]
        return cell
    }
}
