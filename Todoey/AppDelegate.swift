//
//  AppDelegate.swift
//  Todoey
//
//  Created by 陳剣輝 on 2018/03/03.
//  Copyright © 2018年 陳剣輝. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
            _ = try Realm()
        } catch {
            print("Error initalising new realm, \(error)")
        }
        
        return true
    }
}

