// swift-tools-version:4.2.0
import PackageDescription

let package = Package(
    name: "VaporAPI-Belajar-1",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMinor(from: "3.3.0")),
        .package(url: "https://github.com/vapor/leaf.git", .upToNextMinor(from: "3.0.0")),
        .package(url: "https://github.com/vapor/fluent-sqlite.git", .upToNextMinor(from: "3.0.0")),
        .package(url: "https://github.com/vapor/fluent-postgresql.git", from: "1.0.0")
    ],
    targets: [
    .target(name: "App", dependencies: ["Vapor", "Leaf", "FluentSQLite", "FluentPostgreSQL"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"]),
    ]
)

