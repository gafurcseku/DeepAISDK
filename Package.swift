// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeepAISDK",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "DeepAISDK",
            targets: ["DeepAISDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.10.0"))
    ],
    targets: [
        .target(
            name: "DeepAISDK",
            dependencies: ["Alamofire"],
            path: "Sources"
        ),
        .testTarget(
            name: "DeepAISDKTests",
            dependencies: ["DeepAISDK","Alamofire"]
        )
    ]
)
