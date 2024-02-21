import Foundation
import Fluent
import Vapor

final class Isps: Model, Content {
    
    static let schema = "isps_names"
    
    @ID(key: .id) // primary key
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "contact_info") // Add this line to define the "rate" column
    var contact_info: String // Change the type to match your requirements
    
    
    @Siblings(through: neighborhoodIsp.self, from: \.$Isps, to: \.$neighberhood)
    var neighberhood: [neighborhood]
    
    
    init() {}
    
    init(id: UUID? = nil, name: String, contact_info: String) { // Add the "rate" parameter to the initializer
        self.id = id
        self.name = name
        self.contact_info = contact_info // Initialize the "rate" property
    }
    
}
