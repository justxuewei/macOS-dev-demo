//
//  AppDelegate.swift
//  LoginWindowByCode
//
//  Created by XavierNiu on 2019/10/6.
//  Copyright © 2019 xav1er. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    lazy var loginWindowController: LoginWindowController = {
        return LoginWindowController()
    }()

    lazy var mainWindowController: MainWindowController = {
        return MainWindowController()
    }()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        registerNotification()
        loginWindowController.showWindow(self)
    }


    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.loginOK(_:)), name: Notification.Name.loginOK, object: nil)
    }

    @objc func loginOK(_ notification: Notification) {
        mainWindowController.showWindow(self)
    }

}
