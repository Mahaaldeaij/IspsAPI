
//
//  File.swift
//
//
//  Created by Basmah Ali on 08/08/1445 AH.
//

import Foundation
import Vapor


struct ISPConroller: RouteCollection{
    func boot(routes: RoutesBuilder) throws {
        
        let Isps = routes.grouped("Isps")
        
        Isps.post(use:create)
        Isps.get(use:index)
        Isps.get(":id", use: getISPByID)
        Isps.put(use:update)
        Isps.delete(":id", use: delete)
        
    }
    
    //POST
    func create (req: Request)throws-> EventLoopFuture<Isps>{
        let Isps = try req.content.decode(Isps.self)
        return Isps.create(on: req.db).map{Isps}
        
    }
    /*
     func index (req: Request)throws-> [Plant]{
     }*/
    
    //GET
    func index(req: Request) throws -> EventLoopFuture<[Isps]>{
    
        Isps.query(on: req.db).all()
    }
 
    
    // read or GET by ID
    func getISPByID(req: Request) throws -> EventLoopFuture<Isps>{
        return Isps.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
        
    }
 
    
    //Update
    func update(req: Request) throws -> EventLoopFuture<HTTPStatus>{
        let newIsp = try req.content.decode(Isps.self)
        return Isps.find(newIsp.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{
                $0.name = newIsp.name
                return $0.update(on: req.db)
                .transform(to: .ok)
            }
    }
    

    //DELETE
   
    func delete(req: Request)throws->EventLoopFuture<HTTPStatus>{
        return Isps.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {$0.delete(on: req.db)}
            .transform(to: .ok)
    }
   }
