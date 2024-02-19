import Vapor
import Foundation
import Combine

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get ("ISPs") { req async throws -> [ISP] in
        let ISPs: [ISP] = [.init(name: "STC", rate: "7/10"),
                           .init(name: "Mobily", rate: "5/10"),
                           .init(name: "Salam", rate: "5/10"),
                           .init(name: "Zain", rate: "6/10"),
                           .init(name: "Yaqout", rate: "6/10")
    ]
    return ISPs
 
    }
    
    app.get ("Users") { req async throws -> [User] in
        let users: [User] = [.init(userID: "id-243", name: "Basmah", neighberhood:"Narjis"),
                             .init(userID: "id-55", name: "Maha", neighberhood:"Qurtubah"),
                             .init(userID: "id-2", name: "Sara", neighberhood:"Yasmin"),
                             .init(userID: "id-690", name: "Ala", neighberhood:"Muruj")
    ]
    return users
 
    }
    
    app.get ("Neighberhoods") { req async throws -> [Neighberhood] in
        let neighberhoods: [Neighberhood] = [.init(cityName:"NarjisRiyadh", name: "Narjis", city: "Riyadh"),
                                             .init(cityName:"QurtubahRiyadh", name: "Qurtubah", city: "Riyadh"),
                                             .init(cityName:"YasminRiyadh", name: "Yasmin", city: "Riyadh"),
                                             .init(cityName:"MurujRiyadh", name: "Muruj", city: "Riyadh"),
                                             .init(cityName:"FalahRiyadh", name: "Falah", city: "Riyadh"),
                                             .init(cityName:"WorudRiyadh", name: "Worud", city: "Riyadh"),
                                             .init(cityName:"SulaimaniahRiyadh", name: "Sulaimaniah", city: "Riyadh")
    ]
    return neighberhoods
 
    }
    
}

