//
//  Group.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/4/23.
//

import Foundation
import RealmSwift

class Group: Object, Identifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var admin: String = ""
    @Persisted var groupName: String = ""
    @Persisted var idString: String = ""
    @Persisted var items: List<String>
    @Persisted var users: List<String>
}
