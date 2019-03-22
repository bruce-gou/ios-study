//
//  AppDelegate.swift
//  demo
//
//  Created by super华 on 2019/3/6.
//  Copyright © 2019年 supper 华. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //willFinishLaunchingWithOptions: - 这个方法是你在启动时的第一次机会来执行代码
        //didFinishLaunchingWithOptions: - 这个方法允许你在显示app给用户
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: RootViewController())
        self.window?.rootViewController = navigationController
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // app将要从前台切换到后台时需要执行的操作
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // app已经进入后台后需要执行的操作
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // app将要从后台切换到前台需要执行的操作，但app还不是active状态
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // app已经切换到active状态后需要执行的操作
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // app将要结束时需要执行的操作
    }


}

