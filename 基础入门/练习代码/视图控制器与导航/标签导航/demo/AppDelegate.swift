//
//  AppDelegate.swift
//  demo
//
//  Created by super华 on 2019/3/20.
//  Copyright © 2019年 supper 华. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
//        let navigationController = UINavigationController(rootViewController: RootViewController())
        
        let tabBarController = UITabBarController()
        
        let viewController1 = HeiViewController()
        viewController1.tabBarItem.title = "黑龙江"
        viewController1.tabBarItem.image =  resizeImage(image: UIImage(named: "Image-5")!, newWidth: 30)
        let viewController2 = JiViewController()
        viewController2.tabBarItem.title = "吉林"
        viewController2.tabBarItem.image =  resizeImage(image: UIImage(named: "Image-6")!, newWidth: 30)
        let viewController3 = LiaoVviewController()
        viewController3.tabBarItem.title = "辽宁"
        viewController3.tabBarItem.image =  resizeImage(image: UIImage(named: "Image-7")!, newWidth: 30)
        tabBarController.viewControllers = [viewController1, viewController2, viewController3]
        
        
        self.window?.rootViewController = tabBarController
        self.window?.backgroundColor = UIColor.white
        
        return true
    }
    // 缩放 image
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width:newWidth, height:newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()
        
        return newImage!
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

