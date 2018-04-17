//
//  ScriptService.swift
//  PathToGo
//
//  Created by Hanson on 2018/4/13.
//  Copyright © 2018年 Chih-Hao. All rights reserved.
//

import Cocoa

struct ScriptService {
    
    static func copyCurrentFinderPath() -> String {
        
        guard let scriptUrl = Bundle.main.path(forResource: "copyCurrentPath", ofType: "scpt"),
            let script = NSAppleScript(contentsOf: URL(fileURLWithPath: scriptUrl), error: nil) else {
                return ""
        }

        guard let pathString = script.executeAndReturnError(nil).stringValue else {
            return ""
        }
        
        return pathString
       
//        let pasteboard = NSPasteboard.general
//        pasteboard.declareTypes([.string], owner: nil)
//        pasteboard.setString(pathString, forType: .string)
    }
    
    
}
