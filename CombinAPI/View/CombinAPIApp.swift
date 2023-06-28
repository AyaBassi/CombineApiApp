//
//  CombinAPIApp.swift
//  CombinAPI
//
//  Created by Payam Karbassi on 27/06/2023.
//

import SwiftUI

@main
struct CombinAPIApp: App {
   //let persistenceController = PersistenceController.shared
    
    
    var body: some Scene {
        WindowGroup {
            ProductView().environmentObject(Coordinator())
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
