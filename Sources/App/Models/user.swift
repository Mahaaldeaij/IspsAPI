//
//  File.swift
//  
//
//  Created by Rahaf on 20/02/2024.
//

import Foundation
import Fluent
import Vapor

final class User: Model, Content {
    
    static let schema = "user"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "neighborid")
    var neighberhood: UUID
    
    init() {}
    
    init(id: UUID? = nil, name: String, neighberhood: UUID) {
        self.id = id
        self.name = name
        self.neighberhood = neighberhood
    }
    
}
