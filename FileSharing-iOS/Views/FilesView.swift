//
//  FilesView.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/4/23.
//

import Foundation
import SwiftUI
import RealmSwift


struct FilesView: View {

    @ObservedResults(Item.self) var items
    
    var body: some View {
        NavigationView{
            List{
                ForEach(items){ item in
                    FileItem(item: item)
                }
                .onDelete(perform: removeItem)
            }.navigationBarTitle("Items")
        }
        
        
    }
    func removeItem(at offsets: IndexSet){
        let desertRef = storageRef.child("images/1986368399")

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
