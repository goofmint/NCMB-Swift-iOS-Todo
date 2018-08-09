//
//  ViewController.swift
//  NCMBTodoSwift
//
//  Created by nakatsugawa on 2018/08/03.
//  Copyright © 2018年 MOONGIFT. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
	
	@IBOutlet weak var todosView: UITableView!
	@IBAction func backToTop(segue: UIStoryboardSegue) {}
	@IBOutlet weak var addButton: UIBarButtonItem!
	
	var todos = [NCMBObject]()
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
		TodoCell.textLabel!.text = self.todos[indexPath.row].object(forKey: "task") as? String
		return TodoCell
	}
	

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		let user = NCMBUser.current()
		addButton.isEnabled = !(user == nil)
		let relation = user?.relationforKey("tasks2")
		relation?.query().findObjectsInBackground({(results, error) in
			if error != nil {
			} else {
				self.todos = results as! [NCMBObject]
				self.todosView?.reloadData()
			}
		})
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		//戻り値の設定(表示するcell数)
		return self.todos.count
	}
	
}

