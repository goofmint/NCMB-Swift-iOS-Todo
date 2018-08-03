//
//  ViewController.swift
//  NCMBTodoSwift
//
//  Created by nakatsugawa on 2018/08/03.
//  Copyright © 2018年 MOONGIFT. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
		TodoCell.textLabel!.text = todos[indexPath.row]
		return TodoCell
	}
	

	override func viewDidLoad() {
		super.viewDidLoad()
		if UserDefaults.standard.object(forKey: "TodoList") != nil {
			todos = UserDefaults.standard.object(forKey: "todos") as! [String]
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		//戻り値の設定(表示するcell数)
		return todos.count
	}
	
}

