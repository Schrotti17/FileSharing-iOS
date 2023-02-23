//
//  GroupFiles.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/23/23.
//

import SwiftUI
import Foundation
import RealmSwift

struct GroupFiles: View {

    let groupId: String
    @ObservedResults(Item.self) var items

    var groupItems: [Item] {
        print("\(groupId)")
        var itemsList = [Item]()
        itemsList.append(contentsOf: items.filter("%@ IN owner", "\(groupId)"))
        return itemsList
    }

    var body: some View {
        List{
            ForEach(groupItems){ item in
                FileItem(item: item)
            }.onDelete(perform: removeItem)
        }.navigationBarTitle("Items")
    }

    func removeItem(at offsets: IndexSet){
        let location = offsets.map { $items.wrappedValue[$0].location }[0]
        let desertRef = storageRef.child("\(location)")
        // Delete the file
        desertRef.delete { error in
          if let error = error {
            // Uh-oh, an error occurred!
          } else {
              $items.remove(atOffsets: offsets)
            }
        }
    }
}
