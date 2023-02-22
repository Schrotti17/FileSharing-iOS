//
//  HomeView.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/6/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct HomeView: View {

    @ObservedResults(AppUser.self) var user
    var body: some View {
        TabView {
            GroupView()
                .tabItem(){
                    Image(systemName: "person.3.fill")
                    Text("Groups")
                }
            FilesView()
                .tabItem(){
                    Image(systemName: "doc.text.fill")
                    Text("Files")
                }
            
            AccountView(user: user[0])
                .tabItem(){
                    Image(systemName: "person.fill")
                    Text("Account")
                }
        }
    }
}
