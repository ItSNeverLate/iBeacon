//
//  iBeaconApp.swift
//  iBeacon
//
//  Created by Parsa on 10.10.23.
//

import SwiftUI
import Firebase

@main
struct iBeaconApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
        
    init() {
        FirebaseApp.configure()

    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    var databaseReference: DatabaseReference = Database.database().reference(fromURL: "https://ibeacon-dde3e-default-rtdb.firebaseio.com/")
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.databaseReference.child(formattedTime() + " will Finish Launching WithOptions").setValue(0)
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.databaseReference.child(formattedTime() + "  did Finish Launching WithOptions").setValue(0)
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        self.databaseReference.child(formattedTime() + " application Will Terminate").setValue(0)
    }
    
    func formattedTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss SSS"
            
        return dateFormatter.string(from: Date())
    }
}
