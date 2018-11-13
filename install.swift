//
//  install.swift
//  Install VIPER Template
//
//  Created by Bogdan Evsenev on 25.09.18.
//

import Foundation

let templateName = "VIPER Module.xctemplate"
let destinationRelativePath = "/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/Architecture"

func moveTemplate() {
    let fileManager = FileManager.default
    let destinationPath = bash(command: "xcode-select", arguments: ["--print-path"]).appending(destinationRelativePath)
    
    do {
        let url = URL(fileURLWithPath: destinationPath + "/\(templateName)")
        let templatePath = fileManager.currentDirectoryPath + "/\(templateName)"
        try fileManager.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
        if !fileManager.fileExists(atPath:"\(destinationPath)/\(templateName)") {
            try fileManager.copyItem(atPath: templatePath, toPath: "\(destinationPath)/\(templateName)")
            printInConsole("✅ VIPER Template succesfully installed.")
        } else {
            try _ = fileManager.replaceItemAt(URL(fileURLWithPath:"\(destinationPath)/\(templateName)"), withItemAt: URL(fileURLWithPath: templatePath))
            printInConsole("✅ VIPER Template already exists. Has been succesfully replaced.")
        }
    } catch let error as NSError {
        printInConsole("⛔️ Error: \(error.localizedFailureReason!)")
    }
}

func shell(launchPath: String, arguments: [String]) -> String {
    let task = Process()
    task.launchPath = launchPath
    task.arguments = arguments
    
    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: String.Encoding.utf8)!
    if output.count > 0 {
        let lastIndex = output.index(before: output.endIndex)
        return String(output[output.startIndex ..< lastIndex])
    }
    return output
}

func bash(command: String, arguments: [String]) -> String {
    let whichPathForCommand = shell(launchPath: "/bin/bash", arguments: [ "-l", "-c", "which \(command)" ])
    return shell(launchPath: whichPathForCommand, arguments: arguments)
}

func printInConsole(_ message:Any) {
    print("=================================")
    print("\(message)")
    print("=================================")
}

moveTemplate()


