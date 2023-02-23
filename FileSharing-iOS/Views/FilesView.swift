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
            HStack{
                List{
                    ForEach(items){ item in
                        FileItem(item: item)
                    }
                    .onDelete(perform: removeItem)
                }.navigationBarTitle("Items")
                Button(action: sendItem label: {
                    Image(systemName: "pencil")
                })
            }
            
        }
        
        
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


    func sendItem(at offsets: IndexSet){

    }
}
