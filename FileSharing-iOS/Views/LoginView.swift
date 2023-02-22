//
//  LoginView.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/4/23.
//

import RealmSwift
import SwiftUI

struct LoginView: View {

    @State private var email = ""
    @State private var password = ""
    @State private var username = ""

    var body: some View {
        VStack {
            TextField("Email", text: self.$email).padding()
            SecureField("Password", text: self.$password).padding()
            TextField("Username", text: self.$username).padding()
            
            HStack{
                Button("Log In"){
                    
                    Task.init {await login(email, password)}
                }
                Button("Register"){
                    register(email, password, username)
                }
            }
        }
    }
    
    func login(_ email: String, _ password: String) async {
        
        do {
            let user = try await app.login(credentials: Credentials.emailPassword(email: email, password: password))
            print("Successfully logged in as user \(user)")
        } catch {
            print("Login failed: \(error.localizedDescription)")
        }
    }
    
    func register(_ email: String, _ password: String, _ username: String){
        
    }
}

