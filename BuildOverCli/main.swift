//
//  main.swift
//  BuildOverCli
//
//  Created by Dave Agyakwa on 29/01/2022.
//

import Foundation
import ArgumentParser

struct BuilOver: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "", subcommands: [SignIn.self, Notify.self])

    @Flag(name:.shortAndLong,help: "Watches current build and notifies sends a notification when done ")
    var watchBuild: Bool = false
    func run() throws {

    }
}

BuilOver.main()

// Subcommands

extension BuilOver {

    struct Notify: ParsableCommand {
        @Argument(help: "Title of the build, it could eg. {name of application}")
        var title: String

        @Argument(help: "A short text decribing the build eg. new feature build")
        var description: String?

        @Flag(name: .shortAndLong, help: "Whether turn play an alarm ,by default it's set to false")
        var alarm: Bool = false


        func validate() throws {
            if title.isEmpty {
                throw ValidationError("Must include a title")
            }
        }

        func run() throws {}
    }
}

extension BuilOver {
    struct SignIn: ParsableCommand {
        static let configuration = CommandConfiguration(abstract: "")

        func run() throws {
            // TODO: IMPLEMENT APPLE SIGN IN
        }
    }
}

//
// extension BuilOver{
//    //TODO: PARSE XCODE COMMAND TO DERIVED TITLE AND DESCRIPTION FROM IT
//
//    struct Watch :ParsableCommand {
//        @Argument(help: "Title of the build  notification")
//        var title : String
//
//        @Argument(help: "description of the build ")
//        var description : String
//
//
//    }
// }



