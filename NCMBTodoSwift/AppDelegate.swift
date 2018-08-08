//
//  AppDelegate.swift
//  NCMBTodoSwift
//
//  Created by nakatsugawa on 2018/08/03.
//  Copyright © 2018年 MOONGIFT. All rights reserved.
//

import UIKit
import Keys

let keys = NCMBTodoSwiftKeys()
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		NCMB.setApplicationKey(keys.applicationKey , clientKey: keys.clientKey)
		let currentUser = NCMBUser.current()
		if currentUser != nil {
			return true
		}

		let uuid = UserDefaults.standard.string(forKey: "uuid")
		if uuid == nil {
			NCMBAnonymousUtils.logIn { (user, error) in
				if error != nil {
					print ("Log in failed")
					print (error ?? "")
				} else {
					print("Logged in")
					let authData = user!.object(forKey: "authData") as! [String: Any]
					let uuid = (authData["anonymous"] as! [String: String])["id"]
					UserDefaults.standard.set(uuid, forKey: "uuid")
				}
			}
		} else {
			let user = NCMBUser.init()
			let anonymousDic = ["anonymous": ["id": uuid]]
			user.setObject(anonymousDic, forKey: "authData")
			user.signUpInBackground({(error) in
				if error != nil {
					print("Error")
				} else {
					print("Log in")
				}
			})
		}
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

