//
//  DebugLogger.swift
//  LotteryThExample
//
//  Created by Apinun on 5/7/2566 BE.
//

import Foundation

public struct DebugLogger {
    static func log(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
        let fileURL = URL(fileURLWithPath: file)
        _ = fileURL.pathExtension
        let fileName = "\(URL(fileURLWithPath: file).deletingPathExtension().lastPathComponent)"
        let logMessage = "\(message): \(fileName), \(function) line #\(line)"
        print(logMessage)
        #endif
    }
    
    static func retain(file: String = #file) {
        #if DEBUG
        let fileURL = URL(fileURLWithPath: file)
        _ = fileURL.pathExtension
        let fileName = "\(URL(fileURLWithPath: file).deletingPathExtension().lastPathComponent)"
        print("retain: \(fileName)")
        #endif
    }
    
    static func release(file: String = #file) {
    #if DEBUG
        let fileURL = URL(fileURLWithPath: file)
        _ = fileURL.pathExtension
        let fileName = "\(URL(fileURLWithPath: file).deletingPathExtension().lastPathComponent)"
        print("\(fileName) is de-initialized")
    #endif
    }
}
