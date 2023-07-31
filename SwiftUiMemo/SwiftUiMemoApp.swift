//
//  SwiftUiMemoApp.swift
//  SwiftUiMemo
//
//  Created by 최승범 on 2023/07/31.
//

import SwiftUI

@main
struct SwiftUiMemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
