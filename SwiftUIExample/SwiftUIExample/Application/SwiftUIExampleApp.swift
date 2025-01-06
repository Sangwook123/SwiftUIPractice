//
//  SwiftUIExampleApp.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 12/23/24.
//

import SwiftUI

@main
struct SwiftUIExampleApp: App {
    @StateObject var router = RouterRegistry()
    
    init() {
        DIContainer.shared.registerDependency()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(router)
        }
    }
}
