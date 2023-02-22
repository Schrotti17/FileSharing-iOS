//
//  ContentView.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/22/23.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @ObservedObject var app: RealmSwift.App
    var body: some View {
        

        if let user = app.currentUser {
            
            let config = user.flexibleSyncConfiguration(initialSubscriptions: {subs in
                
                subs.remove(named: "all_items")
                if let _ = subs.first(named: "my_items"){
                    // Existing subscription found - do nothing
                    return
                } else {
                    subs.append(QuerySubscription<Group>())
                    subs.append(QuerySubscription<Item>(){
                       ($0.creator == app.currentUser!.id) && ($0.public1 == false)
                    })
                    subs.append(QuerySubscription<AppUser>(){
                        $0.ownerId == app.currentUser!.id
                    })
                }
            }, rerunOnOpen: true)
            
            OpenRealmView(user: user)
                .environment(\.realmConfiguration, config)
        } else { LoginView()}
    }
}
