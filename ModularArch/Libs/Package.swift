// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Libs",
    platforms: [.macOS(.v10_14), .iOS(.v13), .tvOS(.v13)],
    products: [
        .library(
            name: "Libs",
            type: .dynamic,
            targets: ["Libs"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.4")),
        .package(url: "https://github.com/hackiftekhar/IQKeyboardManager.git", from: "6.5.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.6.0"),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
        .package(url: "https://github.com/onevcat/Kingfisher.git", branch: "version6-xcode13")
    ],
    targets: [
        .target(
            name: "Libs",
            dependencies: [
                "Alamofire",
                .product(name: "IQKeyboardManagerSwift", package: "IQKeyboardManager"),
                "RxSwift",
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "ReactiveMoya", package: "Moya"),
                "Kingfisher",
            ]),
        .testTarget(
            name: "LibsTests",
            dependencies: ["Libs"]),
    ]
)
