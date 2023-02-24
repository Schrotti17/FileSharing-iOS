//
//  FileSharing.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/24/23.
//

import SwiftUI
import Foundation



struct FileSharing: View {
    
    private let photo = Image("school")
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            photo
                .resizable()
                .scaledToFit()

            ShareLink(item: photo, preview: SharePreview("Big Ben", image: photo))
                }
            .padding(.horizontal)
        
    }
}
