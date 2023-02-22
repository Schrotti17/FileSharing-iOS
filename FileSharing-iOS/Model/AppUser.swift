//
//  AppUser.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/4/23.
//

import Foundation
import RealmSwift

class AppUser: Object, Identifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var email: String = ""
    @Persisted var groups: List<String>
    @Persisted var idString: String = ""
    @Persisted var items: List<String>
    @Persisted var ownerId: String = ""
    @Persisted var userName: String = ""
}
