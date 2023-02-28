//
//  FileSharing.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/24/23.
//

import SwiftUI
import Foundation
import SDWebImageSwiftUI


//struct Loader: UIViewRepresentable{
  //  func makeUIView(context: UIViewRepresentableContext<Loader>) -> UIActivityIndicatorView {
    //    let indicator = UIActivityIndicatorView(style: .medium)
      //  indicator.startAnimating()
        //return indicator
    //}
    
    //func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Loader>) {
        
    //}
//}

struct FileSharing: View {
    
    let location: String
    @State var url = ""
    
    
    var body: some View {
        ZStack{
            VStack {
                Text("\(location)")
                if url != ""{
                    AsyncImage(url: URL(string: url)!, scale: 15).frame(width: 250, height: 250).padding()
                } else {
                    //Loader()
                }}
            .onAppear{
                let storage = storageRef.child("\(location)").downloadURL{(url, err) in
                    if err != nil {
                        return
                    }
                    self.url = "\(url!)"
                }
            }
        }
        
        //ShareLink(item: imgToShare, preview: SharePreview("\(location)", image: imgToShare.image))
    }
}
    
