//
//  File.swift
//  
//
//  Created by Maha on 09/08/1445 AH.
//

//
//  File.swift
//
//
//  Created by Maha on 09/08/1445 AH.
//

//
//  File.swift
//
//
//  Created by Basmah Ali on 08/08/1445 AH.
//

import Foundation
import Vapor

struct UserController: RouteCollection{
    func boot(routes: Vapor.RoutesBuilder) throws {
        
        let users = routes.grouped("users")
        users.post(use:create)
        users.get(use:read)
        users.put(use:update)
        
        users.delete(use:delete)
    }
    
    
    //Create
    func create(req: Request) async throws -> String{
        return "New User Created"
    }
    
    // read
    
    func read(req: Request) async throws -> String{
        return "All Users displayed"
    }
    
    //Update
    func update(req: Request) async throws -> String{
        // let userID = req.body.string ?? "nil"
        return "Update User "
    }
    
    //Delete by ID
    
    func delete(req: Request) async throws -> String{
        
        //let userID = req.body.string ?? "nil"
        return "Delete User "
    }
}
