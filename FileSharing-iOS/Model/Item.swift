//
//  Item.swift
//  FileSharing-iOS
//
//  Created by mm507d1 on 2/4/23.
//

import RealmSwift

class Item: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var creator: String = ""
    @Persisted var fileType: String = ""
    @Persisted var idString: String = ""
    @Persisted var location: String = ""
    @Persisted var owner: List<String>
    @Persisted var public1: Bool = false
}
