//
//  GroupView.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/4/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct GroupView: View {

    @ObservedResults(Group.self) var groups
    var groupMembers: [Group] {
        var groupsList = [Group]()
        groupsList.append(contentsOf: groups.filter("%@ IN users", "thom.stahl.04@gmail.com"))
        return groupsList
    }
    var body: some View {
        NavigationView{
            List{
                ForEach(groupMembers){ group in
                    GroupItem(group: group)
                }
            }.navigationBarTitle("Groups")
        }
    }}
