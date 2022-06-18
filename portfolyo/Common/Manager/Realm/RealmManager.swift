//
//  RealmManager.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import RealmSwift

final class RealmManager {
    
    private static func realmConfig() -> Realm.Configuration {
        return Realm.Configuration(schemaVersion: 1)
    }
    
    static func realmInstance() -> Realm {
        do {
            let newRealm = try Realm(configuration: realmConfig())
            return newRealm
        }catch let error {
            fatalError("Unable to create an instance of Realm \(error.localizedDescription)")
        }
    }
}
