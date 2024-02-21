//
//  File.swift
//  
//
//  Created by Rahaf on 20/02/2024.
//

import Fluent


struct userCreationMigration: AsyncMigration{
    func prepare(on database:Database) async throws {
        try await database.schema("users")
            .id()
            .field("name", .string)
            .field("neighborid", .uuid, .references("neighborhood", "id"))
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("users").delete()
    }
}
