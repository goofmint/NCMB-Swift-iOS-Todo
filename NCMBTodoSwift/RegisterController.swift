//
//  RegisterController.swift
//  NCMBTodoSwift
//
//  Created by nakatsugawa on 2018/08/08.
//  Copyright © 2018年 MOONGIFT. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {
	@IBOutlet weak var userNameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBAction func registerButton(_ sender: Any) {
		let user = NCMBUser.init()
		user.userName = userNameTextField.text!
		user.password = passwordTextField.text!
		user.signUpInBackground({(error) in
			var params = [String: String]()
			if error != nil {
				params["title"] = "Error"
				params["message"] = error?.localizedDescription
			} else {
				params["title"] = "登録完了"
				params["message"] = "登録完了しました"
			}
			let alert = UIAlertController(title: params["title"], message: params["message"], preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "OK", style: .default))
			self.present(alert, animated: true, completion: nil)
		})
	}
	
	@IBAction func loginButton(_ sender: Any) {
		NCMBUser.logInWithUsername(inBackground: userNameTextField.text!, password: passwordTextField.text!, block: {(user, error) in
			if error != nil {
				let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
				alert.addAction(UIAlertAction(title: "OK", style: .default))
				self.present(alert, animated: true, completion: nil)
			} else {
				let user = NCMBUser.current()
				print(user)
				self.performSegue(withIdentifier: "backToTop", sender: self)
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
