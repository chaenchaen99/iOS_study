//
//  TodoViewController.swift
//  MyUIKit
//
//  Created by admin on 2024/01/16.
//

import UIKit

struct TodoItem {
    let title: String
    var isCompleted: Bool
}
class TodoViewController: UIViewController {
    //TodoCell
   
    @IBOutlet weak var todoTableView: UITableView!
    
    var data : [TodoItem] = [
        TodoItem(title: "커밋하기", isCompleted: false),
        TodoItem(title: "운동하기", isCompleted: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.backgroundColor = .brown
        todoTableView.dataSource = self
        todoTableView.delegate = self
        //self가 테이블 뷰를 생성할 위임을 받았다
    }
}
extension TodoViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let myAction = UIContextualAction(style: .normal, title: "완료") { action, view, completionHandler in
            
            self.data[indexPath.row].isCompleted.toggle()
            self.todoTableView.reloadData()
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [myAction])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        
        if data[indexPath.row].isCompleted {
            cell.textLabel?.textColor = .green
        }else{
            cell.textLabel?.textColor = .red
        }
        cell.textLabel?.text = data[indexPath.row].title
        
        return cell
    }
    
    
}
