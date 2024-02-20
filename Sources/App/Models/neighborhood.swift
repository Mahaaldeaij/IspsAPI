//
//  File.swift
//  
//
//  Created by Basmah Ali on 10/08/1445 AH.
//
import Foundation
import Fluent
import Vapor

final class neighborhood: Model, Content {
    
    static let schema = "neighborhood"
    
    @ID
    var id: UUID? // primary key
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "City")
    var City: String 
    
    init() {}
    
    init(id: UUID? = nil, name: String, City: String) {
        self.id = id
        self.name = name
        self.City = City
    }
    
}
