//
//  File.swift
//  
//
//  Created by Rahaf on 21/02/2024.
//

import Fluent
import Vapor

struct neighborIspController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        
        let neighborIsp = routes.grouped("neighborhoodIsp")
        
        neighborIsp.post(use:create)
        neighborIsp.get(use:read)
        neighborIsp.put(use:update)
        neighborIsp.delete(use:delete)
    }
   
    
    //CREATE
    func create(req: Request)throws -> EventLoopFuture<neighborhoodIsp> {
        let neighborIsp = try req.content.decode(neighborhoodIsp.self)
        return neighborIsp.create(on: req.db).map{neighborIsp}
    }
    

    // READ
    func read(req: Request) throws -> EventLoopFuture<[neighborhoodIsp]>{
        neighborhoodIsp.query(on: req.db).all()
    }
  
    //UPDATE
    func update(req: Request) throws -> EventLoopFuture<HTTPStatus>{
        let neighborIsp = try req.content.decode(neighborhoodIsp.self)
        return neighborhoodIsp.find(neighborIsp.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{$0.id = neighborIsp.id
                return $0.update(on: req.db)
                .transform(to: .ok)}
    }
    
    
    
    //DELETE
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus>{
        return neighborhoodIsp.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {$0.delete(on: req.db)}
            .transform(to: .ok)
    }
}

