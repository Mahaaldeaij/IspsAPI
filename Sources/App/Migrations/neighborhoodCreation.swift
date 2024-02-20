//
//  File.swift
//  
//
//  Created by Basmah Ali on 10/08/1445 AH.
//


import Fluent


struct neighborhoodCreationMigration: AsyncMigration{
    func prepare(on database:Database) async throws {
        try await database.schema("neighborhood")
            
            .id()
            .field("name", .string )
            .field("City", .string)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("neighborhood").delete()
    }
}

