//
//  File.swift
//  
//
//  Created by Basmah Ali on 11/08/1445 AH.
//

import Foundation
import Fluent

struct neighborIspCreation: AsyncMigration{
    func prepare(on database: Database) async throws {
            database.schema("neighborhoodIsp")
            .id()
            .field("n_id", .uuid, .references("neighborhood", "id"))
            .field("isp_id", .uuid, .references("Isps", "id"))
    }
    
  
    func revert(on database: Database) async throws { // convert prepare function
        try await database.schema("neighborhoodIsp").delete()
    }
}
