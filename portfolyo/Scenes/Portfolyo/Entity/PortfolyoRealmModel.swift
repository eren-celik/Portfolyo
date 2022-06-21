//
//  PortfolyoRealmModel.swift
//  portfolyo
//
//  Created by Eren  Çelik on 18.06.2022.
//

import RealmSwift

final class PortfolyoRealmModel: Object {
    
    @Persisted var dataId = UUID().uuidString
    @Persisted var itemId: String = ""
    @Persisted var name: String = ""
    @Persisted var quantitiy: Int = 0
    @Persisted var sparkline = List<Double>()
    
    convenience init(itemId: String = "",
                     name: String = "",
                     quantitiy: Int = 0,
                     sparkline: List<Double> = List<Double>()) {
        self.init()
        self.itemId = itemId
        self.name = name
        self.quantitiy = quantitiy
        self.sparkline = sparkline
    }
    
    override static func primaryKey() -> String? {
        return "dataId"
    }
}
