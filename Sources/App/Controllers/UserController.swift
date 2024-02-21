

import Foundation
import Vapor

struct UserController: RouteCollection{
    func boot(routes: RoutesBuilder) throws {
        
        let user = routes.grouped("user")
        
        user.post(use:create)
        user.get(use:read)
        user.put(use:update)
        user.delete(use:delete)
    }
   
    
    //CREATE
    func create(req: Request)throws -> EventLoopFuture<User> {
        let user = try req.content.decode(User.self)
        return user.create(on: req.db).map{user}
    }
    

    // READ
    func read(req: Request) throws -> EventLoopFuture<[User]>{
        User.query(on: req.db).all()
    }
  
    //UPDATE
    func update(req: Request) throws -> EventLoopFuture<HTTPStatus>{
        let newUser = try req.content.decode(User.self)
        return User.find(newUser.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{$0.name = newUser.name
                return $0.update(on: req.db)
                .transform(to: .ok)}
    }
    
    
    
    //DELETE
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus>{
        return User.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {$0.delete(on: req.db)}
            .transform(to: .ok)
    }
}
