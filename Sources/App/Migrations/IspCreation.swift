//
//  File.swift
//  
//
//  Created by Maha on 09/08/1445 AH.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct IspCreationMigration: Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("isps_names")
            .id()
           // .field("age", .int, .identifier(auto: true))
            .field("name", .string)

           // .field("name", .string, .identifier(auto: true))
           // .field("name", .string, .)
            .field("contact_info", .string)
             //  define "rate" column
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("isps_names").delete()
    }
}


