import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    //connection with Database
    app.databases.use(.postgres(hostname: "localhost",username: "postgres",password: "",database: "best_isp"), as: .psql)
    
    
    app.migrations.add(IspCreationMigration())
    app.migrations.add(neighborhoodCreationMigration())
    app.migrations.add(userCreationMigration())
    app.migrations.add(neighborIspCreation())
    try await app.autoMigrate()
    // register routes
    try routes(app)
}
