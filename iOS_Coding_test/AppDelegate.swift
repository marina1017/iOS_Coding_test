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

        getArticles()
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

    func getArticles() {
        WebApi.getJsonObject(url: "https://deeplink.dev.n8s.jp/quiz/followables.json", complated: { (jsonObject:AnyObject?) -> Void in
            let json = JSON(jsonObject)
            json["sections"].forEach{(_, data) in
                let title = data["title"].string!
                print(title) // foo or bar
            }
            
//            if let jsonObject: AnyObject = jsonObject{
//                self.qiitList.removeAll(keepCapacity: false)
//                for origin in qiitaJsonObject as! [[String:AnyObject]]{
//                    var dic: [String:AnyObject] = [:]
//                    dic["title"] = origin["title"]
//                    dic["url"] = origin["url"]
//                    self.qiitList.append(dic)
//                }
            
        })

//        Alamofire.request("https://deeplink.dev.n8s.jp/quiz/followables.json").responseJSON{ response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                json["sections"].forEach{(_, data) in
//                    let title = data["title"].string!
//                    print(title) // foo or bar
//                }
//            case .failure(let error):
//                print(error)
//            }
//
//        }
//
//        //APIクライアントの生成
//        let client = FollowablesAPIClient()
//        //リクエストの発行
//        let request = FollowablesAPI.SearchRespositories(keyword: "")
//        //リクエストの送信
//        client.send(request: request, completion: { result in
//            switch result {
//            case let .success(response):
//                for item in response.sections {
//                    print("item.title:",item.title)
//
//                }
//            case let .failure(error):
//                //エラー詳細を出力
//                print(error)
//            }
//        })

    }


}

