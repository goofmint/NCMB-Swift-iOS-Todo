//
//  AddController.swift
//  
//
//  Created by nakatsugawa on 2018/08/03.
//

import UIKit

var todos = [String]()

class AddController: UIViewController {
	@IBOutlet weak var TodoTextField: UITextField!
	
	@IBAction func TodoAddButton(_ sender: Any) {
		todos.append(TodoTextField.text!)
		TodoTextField.text = ""
		UserDefaults.standard.set( todos, forKey: "todos" )
		self.performSegue(withIdentifier: "toList", sender: nil)
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
