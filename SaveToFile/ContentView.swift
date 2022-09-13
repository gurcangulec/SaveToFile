//
//  ContentView.swift
//  SaveToFile
//
//  Created by Gürcan Güleç on 12.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var entry = String()
    let savePath = FileManager.documentsDirectory.appendingPathComponent("Saved.txt")
    
    init() {
        print("Init started")
        print("entry: \(entry)")
        do {
            let data = try Data(contentsOf: savePath)
            entry = try JSONDecoder().decode(String.self, from: data)
            print("doing")
            print(entry)
        } catch {
            entry = String()
        }
    }
    
    var body: some View {
        VStack {
            Button("See") {
                print("entry: \(entry)")
            }
            Button("Save") {
                save()
            }
            Button("Write data") {
                write()
            }
        }
    }
    
    func save() {
        do {
            print(entry)
            let data = try JSONEncoder().encode(entry)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            print("saved")
        } catch {
            print("Unable")
        }
    }
    
    func write() {
        entry = "Something"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
