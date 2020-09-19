import Fluent
//import FluentSQLite
import FluentPostgreSQL
import Leaf
import Vapor

/// Called before your application initializes.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#configureswift)
public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
) throws {
    
    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    // Configure the rest of your application here
    try services.register(LeafProvider())
    config.prefer(LeafRenderer.self, for: ViewRenderer.self)
    
//    let directoryConfig = DirectoryConfig.detect()
//    services.register(directoryConfig)
    
    // Register providers first
//    try services.register(FluentProvider())
    
    // Configure a SQLite database
//    var databaseConfig = DatabasesConfig()
//    let db = try SQLiteDatabase(storage: .file(path: "\(directoryConfig.workDir)cupcakes.db"))
    
    // Register the configured PostgreSQL database to the database config.
//    databaseConfig.add(database: db, as: .sqlite)
//    services.register(databaseConfig)
    
    // Configure migrations
//    var migrationConfig = MigrationConfig()
//    migrationConfig.add(model: Cupcake.self, database: .sqlite)
//    migrationConfig.add(model: Order.self, database: .sqlite)
//    services.register(migrationConfig)
//
    
    
    // Register providers first
    try services.register(FluentPostgreSQLProvider())
    
    // Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config

    let corsConfiguration = CORSMiddleware.Configuration(
        allowedOrigin: .all,
        allowedMethods: [.GET, .POST, .PUT, .OPTIONS, .DELETE, .PATCH],
        allowedHeaders: [.accept, .authorization, .contentType, .origin, .xRequestedWith, .userAgent, .accessControlAllowOrigin]
    ) // CORS Allow Control Acces Cross Origin Policy
    let corsMiddleware = CORSMiddleware(configuration: corsConfiguration)

    middlewares.use(corsMiddleware) // Allow Control Access Cross Origin
    middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)
    
    // Configure a PostgreSQL database
    let config = PostgreSQLDatabaseConfig(
        hostname: "localhost",
        port: 5432,
        username: "metalbee",
        database: "CupcakesCorner",
        password: nil,
        transport: .cleartext)
    let postgres = PostgreSQLDatabase(config: config)
    
    /// Register the configured PostgreSQL database to the database config.
    var databases = DatabasesConfig()
    databases.add(database: postgres, as: .psql)
    services.register(databases)
    
    /// Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: Cupcake.self, database: .psql)
    migrations.add(model: Order.self, database: .psql)
    services.register(migrations)
    
    
}
