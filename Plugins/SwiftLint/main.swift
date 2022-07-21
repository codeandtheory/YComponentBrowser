//
//  main.swift
//  YCatalogViewer
//
//  Created by Tim Barett on 7/20/22.
//  Copyright © 2021 Y Media Labs. All rights reserved.
//

import PackagePlugin

@main
struct SwiftLint: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        [
            .buildCommand(
                displayName: "Linting \(target.name)...",
                executable: try context.tool(named: "swiftlint").path,
                arguments: [
                    "lint",
                    "--in-process-sourcekit",
                    "--config",
                    "\(context.package.directory.string)/.swiftlint.yml",
                    "--path",
                    target.directory.string
                ],
                environment: [:]
            )
        ]
    }
}
