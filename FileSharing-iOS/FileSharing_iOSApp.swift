//
//  FileSharing_iOSApp.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/22/23.
//

import SwiftUI
import RealmSwift
import FirebaseStorage
import FirebaseCore

let app = App(id: "filesharingmobile-dqwye")
let storage = Storage.storage(url: "gs://filesharingjf.appspot.com")
// Create a storage reference from our storage service
let storageRef = storage.reference()



class AppDelegate: NSObject, UIApplicationDelegate {

  func application(
      _ application: UIApplication, 
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
      ) -> Bool {
        
    FirebaseApp.configure()
    return true
  }
}

@main
struct FileSharing_iOS_App: SwiftUI.App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView(app: app)
        }
    }
