// swift-tools-version: 999.0
import PackageDescription

let package = Package(
    name: "MyBinaryToolPlugin",
    targets: [
        // A local tool that uses a build tool plugin.
        .executableTarget(
            name: "MyLocalTool",
            dependencies: [
                "MySourceGenBuildToolPlugin",
            ]
        ),
        // The plugin that generates build tool commands to invoke MySourceGenBuildTool.
        .plugin(
            name: "MySourceGenBuildToolPlugin",
            capability: .buildTool(),
            dependencies: [
                "MyVendedSourceGenBuildTool",
            ]
        ),
        // The vended executable that generates source files.
        .binaryTarget(
            name: "MyVendedSourceGenBuildTool",
            path: "Binaries/MyVendedSourceGenBuildTool.arar"
        ),
    ]
)
