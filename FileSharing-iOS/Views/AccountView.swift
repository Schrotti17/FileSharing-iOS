//
//  AccountView.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/4/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct AccountView: View {

    @ObservedRealmObject var user: AppUser

    var body: some View {
       
        VStack {
            
            SwiftUI.Group {
                Text("Username: \(user.userName)")
                Text("Email: \(user.email)")
                Text("User ID: \(user.idString)")
                Text("Current Realm User ID: \(user.ownerId)")
              
                Button("Log Out"){
                    guard let user = app.currentUser else { return }
                    Task {
                        await logout(user: user)
                    }
                }
            }
        }
    }
    
    func logout(user: User) async {
        do {
            try await user.logOut()
            print("Successfully logged user out")
        } catch {
            print("Failed to log user out: \(error.localizedDescription)")
            // SwiftUI Alert requires the item it displays to be Identifiable.
            // Optional Error is not Identifiable.
            // Store the error as errorText in our Identifiable ErrorMessage struct,
            // which we can display in the alert.
            print("Login failed: \(error.localizedDescription)")
        }
    }
}