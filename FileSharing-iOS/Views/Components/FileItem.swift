//
//  FileItem.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/19/23.
//

import SwiftUI
import RealmSwift

struct FileItem: View {
    
    @ObservedRealmObject var item: Item
    var body: some View {
    
        HStack{
            NavigationLink(destination: FileSharing(item.location)){
                Image(systemName: "photo.fill")
                Text("\(item.location)")
            }
        }
    }
}


