//
//  AppDelegate.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/12.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var navigationController: UINavigationController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {


        self.window = UIWindow()
        self.window?.backgroundColor = .white

        // ページを格納する配列
        var viewControllers: [UINavigationController] = []
        
        let topicIcon: UIImage = UIImage(named:"topic_icon")!
        let starIcon: UIImage = UIImage(named:"star_icon")!
        
        let firstVC = FirstViewController()
        firstVC.tabBarItem = UITabBarItem(title: "トピック一覧", image: topicIcon, tag: 1)
        viewControllers.append(UINavigationController(rootViewController: firstVC))

        let secondVC = SecondViewController()
        secondVC.tabBarItem = UITabBarItem(title: "フォロー済み", image: starIcon, tag: 2)
        
        viewControllers.append(UINavigationController(rootViewController: secondVC))

        // ViewControllerをセット
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(viewControllers, animated: false)

        self.window?.rootViewController = tabBarController

        //現在のウィンドウを表示し、それを同じレベルまたはそれ以下の他のすべてのウィンドウの前に置く便利な関数。
        self.window?.makeKeyAndVisible()
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

