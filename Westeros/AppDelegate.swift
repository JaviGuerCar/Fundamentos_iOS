//
//  AppDelegate.swift
//  Westeros
//
//  Created by Fernando Rodriguez on 7/5/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Crear Window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.cyan
        
        // Creamos unos modelos
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        // Creamos los controladores
        let dataSource = DataSources.houseDataSources(model: houses)
        let dataSourceSeason = DataSources.seasonDataSources(model: seasons)
        
        // Creamos los TablesViewControllers empaquetados en un NavigationController
        let housesVC = ArrayTableViewController(dataSource: dataSource,
                                                delegate: HousesDelegate(),
                                                title: "Houses",
                                                style: .plain).wrappedInNavigation()
        
        let seasonsVC = ArrayTableViewController(dataSource: dataSourceSeason,
                                                 delegate: SeasonsDelegate(),
                                                 title: "Seasons",
                                                 style: .plain).wrappedInNavigation()
        
        // Creamos los botones de los TabBar
        housesVC.tabBarItem = UITabBarItem(title: "Houses", image: #imageLiteral(resourceName: "house_icon.png"), selectedImage: nil)
        seasonsVC.tabBarItem = UITabBarItem(title: "Seasons", image: #imageLiteral(resourceName: "season_icon.png"), selectedImage: nil)
        
        // Creamos el TabBar
        let tabVC = UITabBarController()
        tabVC.viewControllers = [housesVC, seasonsVC]
        
        // Le asignamos el RootVC
        window?.rootViewController = tabVC
        
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

