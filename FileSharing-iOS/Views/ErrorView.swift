//
//  ErrorView.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/20/23.
//

import SwiftUI

struct ErrorView: View {
    @State var error: Error
           
    var body: some View {
        Text("Error: \(error.localizedDescription)")
    }
}

