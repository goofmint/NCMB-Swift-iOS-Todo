//
//  AddController.swift
//  
//
//  Created by nakatsugawa on 2018/08/03.
//

import UIKit

class AddController: UIViewController {
	@IBOutlet weak var TodoTextField: UITextField!
	
	@IBAction func TodoAddButton(_ sender: Any) {
		let obj = NCMBObject(className: "todoClass")
		obj?.setObject(TodoTextField.text!, forKey: "todo")
		obj?.saveInBackground({(err) in
			if err != nil {
				let alertController = UIAlertController(
					title: "エラー",
					message: err?.localizedDescription,
					preferredStyle: UIAlertControllerStyle.alert
				)
				let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ (action: UIAlertAction) in
					print("Hello")
				}
				alertController.addAction(okAction)
				self.present(alertController,animated: true, completion: nil)
			} else {
				self.performSegue(withIdentifier: "toList", sender: nil)
			}
		})		
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
