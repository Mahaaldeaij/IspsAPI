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


struct ISPConroller: RouteCollection{
    func boot(routes: Vapor.RoutesBuilder) throws {
        
        let ISPs = routes.grouped("ISPs")
        
        ISPs.post(use:create)
        ISPs.get(use:read)
        ISPs.get("id", use:readById)
        ISPs.put(use:update)
        ISPs.delete("id:", use:delete)
        
    }
    
    
    //Create
    func create(req: Request) async throws -> String{
        return "New ISP Created"
    }
    
    // read
    
    func read(req: Request) async throws -> String{
        return "All ISPs displayed"
    }
    
    //read by Id
    func readById(req: Request) async throws -> String{
        return "All ISPs displayed by ID"
    }
    
    //Update
    func update(req: Request) async throws -> String{
     
        return "Update ISP "
    }
    
    //Delete by ID
    
    func delete(req: Request) async throws -> String{
        
        let ISPId = req.body.string ?? "nil"
        return "Delete ISP with ID: \(ISPId)"
    }
}
