//
//  AppDelegate.swift
//  PathToGo
//
//  Created by Hanson on 2018/4/13.
//  Copyright © 2018年 Chih-Hao. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var toastWindowCtrl: ToastWindowController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let pathString = ScriptService.copyCurrentFinderPath()
        
        if(pathString == "fail"){
            makeToast("You have reached the top!")
        }else if(pathString == "OK"){
            makeToast("GO BACKSPACE Succeed!")
        }
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
}

extension AppDelegate {
    func makeToast(_ message: String) {
        if toastWindowCtrl != nil {
            toastWindowCtrl.close()
        }
        toastWindowCtrl = ToastWindowController(windowNibName: NSNib.Name(rawValue: "ToastWindowController"))
        toastWindowCtrl.message = message
        toastWindowCtrl.showWindow(self)
        toastWindowCtrl.fadeInHud()
    }
}

