//
//  File.swift
//  
//
//  Created by Basmah Ali on 10/08/1445 AH.
//

import Foundation
import Fluent
import Vapor


final class neighborhoodIsp: Model, Content {
    
    static let schema = "neighborhoodIsp"
    
    @ID
    var id: UUID? // primary key
    
      
    @Parent(key: "n_id")
    var neighberhood : neighborhood // Foreign key
    
    @Parent(key: "isp_id")  // Foreign key
    var Isps: Isps
    
    init() {}
    
    init(id: UUID? = nil, n_id: UUID, isp_id: UUID ) {
        self.id = id
        self.$neighberhood.id = n_id
        self.$Isps.id = isp_id
    }
    
    
    }
 
