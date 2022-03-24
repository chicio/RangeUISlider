// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "RangeUISlider",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "RangeUISlider", targets: ["RangeUISlider"])
    ],
    dependencies: [],
    targets: [.target(name: "RangeUISlider", dependencies: [], path: "./Source") ],
    swiftLanguageVersions: [.v5]
)
