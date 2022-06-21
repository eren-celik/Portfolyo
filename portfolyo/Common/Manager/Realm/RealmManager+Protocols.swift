//
//  RealmManager+Protocols.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import RealmSwift

protocol RealmOperations {
    /// write operation
    func write<T: Object>(_ object: T?, block: @escaping ((Realm, T?) -> Void))
    ///
    /// adds a single object to Realm
    func add(_ object: Object)
    /// adds a list of objects to Realm
    func add<S: Sequence>(_ objects: S) where S.Iterator.Element: Object
    
    /// gets objects from Realm that satisfy the given predicate
    func get<R: Object>(fromEntity entity : R.Type, withPredicate predicate: NSPredicate?,
                               sortedByKey sortKey: String?, inAscending isAscending: Bool) -> Results<R>
    
    /// deletes a single object from Realm
    func delete(_ object: Object)
    
    /// deletes a list of object from Realm
    func delete<S: Sequence>(_ objects: S) where S.Iterator.Element: Object
    
    /// deletes an Entity from Realm based  on the given predicate
    func delete(fromEntity entity: Object.Type, withPredicate predicate: NSPredicate?)
    
    /// updates and overwrites a Realm object
    func update<T: Object>(_ object: T, block: @escaping ((T) -> Void))
}
