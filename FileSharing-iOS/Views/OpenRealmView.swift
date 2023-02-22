//
//  OpenRealmView.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/20/23.
//

import SwiftUI
import RealmSwift

struct OpenRealmView: View {
    @AsyncOpen(appId: "filesharingmobile-dqwye", timeout: 2000) var asyncOpen
    // We must pass the user, so we can set the user.id when we create Item objects
    @State var user: User
    @State var showMyItems = true
    @State var isInOfflineMode = false
    // Configuration used to open the realm.
    @Environment(\.realmConfiguration) private var config
        
    var body: some View {
        switch asyncOpen {
        case .connecting:
            // Starting the Realm.asyncOpen process.
            // Show a progress view.
            ProgressView()
        case .waitingForUser:
            // Waiting for a user to be logged in before executing
            // Realm.asyncOpen.
            ProgressView("Waiting for user to log in...")
        case .open(let realm):
            // The realm has been opened and is ready for use.
            // Show the Items view.
            HomeView()
                // showMyItems toggles the creation of a subscription
                // When it's toggled on, only the original subscription is shown -- "my_items".
                // When it's toggled off, *all* items are downloaded to the
               
        
                // isInOfflineMode simulates a situation with no internet connection.
                // While sync is not available, items can still be written and queried.
                // When sync is resumed, items created or updated offline will upload to
                // the server and changes from the server or other devices will be downloaded to the client.
                .onChange(of: isInOfflineMode) { newValue in
                    let syncSession = realm.syncSession!
                    newValue ? syncSession.suspend() : syncSession.resume()
                }
                .onAppear {
                    if let _ = realm.subscriptions.first(named: "all_items") {
                        // The client was subscribed to all items from a previous
                        // session, so set UI toggle accordingly
                        showMyItems = false
                    }
                }
            
        case .progress(let progress):
            // The realm is currently being downloaded from the server.
            // Show a progress view.
            ProgressView(progress)
        case .error(let error):
            // Opening the Realm failed.
            // Show an error view.
            ErrorView(error: error)
        }
    }
}
