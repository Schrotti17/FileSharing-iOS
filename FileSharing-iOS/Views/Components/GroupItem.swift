//
//  GroupItem.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/20/23.
//

import SwiftUI
import RealmSwift

struct GroupItem: View {
    
    @ObservedRealmObject var group: Group
    
    
    var body: some View {
        HStack{
            Image("school")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 1.5))
                .shadow(radius: 10)
            Text("\(group.groupName)")
        }
    }
}
