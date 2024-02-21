//
//  File.swift
//  
//
//  Created by Rahaf on 20/02/2024.
//

import Foundation
import Fluent
import Vapor

final class users: Model, Content {
    
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Parent(key: "neighborid")
    var neighberhood: neighborhood
    
    init() {}
    
    init(id: UUID? = nil, name: String, neighberhoodId: UUID) {
        self.id = id
        self.name = name
        self.$neighberhood.id = neighberhoodId
    }
    
}
