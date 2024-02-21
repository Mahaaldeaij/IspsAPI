


import Foundation
import Vapor

struct NeighborhoodController: RouteCollection{
    func boot(routes: RoutesBuilder) throws {
        
        let neighborhood = routes.grouped("neighborhood")
        
        neighborhood.post(use:create)
        neighborhood.get(use:read)
        neighborhood.get(":id", use:getById)
        neighborhood.put(use:update)
        neighborhood.delete(":id", use:delete)
      
    }
    
    //Create
    func create(req: Request)throws -> EventLoopFuture<neighborhood> {
        let neighborhood = try req.content.decode(neighborhood.self)
        return neighborhood.create(on: req.db).map{neighborhood}
    }
 
    // GET
    
    func read(req: Request)  throws -> EventLoopFuture<[neighborhood]>{
        neighborhood.query(on: req.db).all()
    }
 
    
    //UPDATE
    func update(req: Request) throws -> EventLoopFuture<HTTPStatus>{
        let newneighborhood = try req.content.decode(neighborhood.self)
        return neighborhood.find(newneighborhood.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{$0.name = newneighborhood.name
                return $0.update(on: req.db)
                .transform(to: .ok)}
    }
  
    //GET by ID
    func getById(req: Request) throws -> EventLoopFuture<neighborhood>{
        return neighborhood.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }
    
    //DELETE
    
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus>{
        return neighborhood.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {$0.delete(on: req.db)}
            .transform(to: .ok)
    }
}
