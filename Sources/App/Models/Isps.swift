import Foundation
import Fluent
import Vapor

final class Comp: Model, Content {
    
    static let schema = "isps"
    
    @ID(key: .id) // primary key
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "contact_info") // Add this line to define the "rate" column
    var rate: Int // Change the type to match your requirements
    
    init() {}
    
    init(id: UUID? = nil, name: String, rate: Int) { // Add the "rate" parameter to the initializer
        self.id = id
        self.name = name
        self.rate = rate // Initialize the "rate" property
    }
    
}
