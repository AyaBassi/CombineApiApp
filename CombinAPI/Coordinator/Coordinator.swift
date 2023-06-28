//
//  Coordinator.swift
//  CombinAPI
//
//  Created by Payam Karbassi on 28/06/2023.
//

import SwiftUI

class Coordinator: ObservableObject {
    
    @Published var navigationPathStack = NavigationPath()
    
    
    func goToProductInfoScreen() {
        DispatchQueue.main.async {
            self.navigationPathStack.append(ScreenEnum.productInfoScreen)
        }
    }
    
    @ViewBuilder
    func getMyScreen(withScreenEnum screenEnum: ScreenEnum) -> some View {
        
        switch screenEnum {
        case .productListScreen:
             ProductView()
        case .productInfoScreen:
            ProductInfoScreen()
        }
    }
}
