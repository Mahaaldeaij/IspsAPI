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

struct NeighborhoodController: RouteCollection{
    func boot(routes: Vapor.RoutesBuilder) throws {
        
        let Neighborhoods = routes.grouped("Neighborhoods")
        
        Neighborhoods.post(use:create)
        Neighborhoods.get(use:read)
        Neighborhoods.get(":id", use:getById)
        Neighborhoods.put(use:update)
        Neighborhoods.delete(":id", use:delete)
      
    }
    
    
    //Create
    func create(req: Request) async throws -> String{
        return "New Neighborhood Created"
    }
    
    // read
    
    func read(req: Request) async throws -> String{
        return "All Neighborhood displayed"
    }
    
    //Update
    func update(req: Request) async throws -> String{
        //let NeighborhoodID = req.body.string ?? "nil"
        return "Update Neighborhood "
    }
    
    //Get by ID
    func getById(req: Request) async throws -> String{
        let NeighborhoodID = req.body.string ?? "nil"
        return "All Neighborhood displayed by ID "
    }
    
    //Delete by ID
    
    func delete(req: Request) async throws -> String{
        
        let NeighborhoodID = req.body.string ?? "nil"
        return "Delete Neighborhood with ID: \(NeighborhoodID)"
    }
}
