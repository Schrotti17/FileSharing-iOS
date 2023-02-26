//
//  FileSharing.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/24/23.
//

import SwiftUI
import Foundation
import RealmSwift


struct Picture: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }
    public var image: Image
}

struct FileSharing: View {
    
    private let location: String
    private let image: UIImage
    private let imgRef = storageRef.child("\(location)")
    imgRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
        if let error = error {
            // Uh-oh, an error occurred!
        } else {
            // Data for "images/island.jpg" is returned
            image = UIImage(data: data!)
        }
    }

    private let imgToShare = Picture(image: Image(image))
    
    
    var body: some View {
        VStack {
            Text("\(location)")
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)

            ShareLink(item: imgToShare, preview: SharePreview("\(location)", image: imgToShare.image))
        }    
    }
}