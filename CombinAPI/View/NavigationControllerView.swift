//
//  NavigationControllerView.swift
//  CombinAPI
//
//  Created by Payam Karbassi on 28/06/2023.
//

import SwiftUI

struct NavigationControllerView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        NavigationStack(path:$coordinator.navigationPathStack ) {
            coordinator.getMyScreen(withScreenEnum: .productListScreen)
                .navigationDestination(for: ScreenEnum.self) { screenEnum in
                    coordinator.getMyScreen(withScreenEnum: screenEnum)
                }
        }
    }
}

struct NavigationControllerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationControllerView().environmentObject(Coordinator())
    }
}
