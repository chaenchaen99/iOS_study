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
        view.backgroundColor = .brown
    }
}

extension MyTableViewController:
    UITableViewDelegate,
    UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = cellData[indexPath.row]
        return cell
    }
}
