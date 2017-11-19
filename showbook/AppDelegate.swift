//
//  AppDelegate.swift
//  showbook
//
//  Created by Binay Budhthoki on 11/16/17.
//  Copyright © 2017 Mojo Monkies. All rights reserved.
//

import UIKit
import CleanroomLogger
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Log.enable()
        Log.info?.message("Initializing Parse Server")
        
        let configuration = ParseClientConfiguration {
            $0.applicationId = "NLI214vDqkoFTJSTtIE2xLqMme6Evd0kA1BbJ20S"
            $0.clientKey = "lgEhciURXhAjzITTgLUlXAEdiMJyIF4ZBXdwfpUr"
            $0.server = "http://localhost:1337/parse"
        }
        
        Parse.initialize(with: configuration)

        return true
    }
}
