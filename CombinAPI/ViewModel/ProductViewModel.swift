//
//  ProductViewModel.swift
//  CombinAPI
//
//  Created by Payam Karbassi on 27/06/2023.
//

import Foundation
import Combine
class ProductViewModel: ObservableObject {
    
    @Published var productModel : ProductModel?
    //@Published var products:[Product] = []
    let combineNetworkManager : CombineNetworkableProtocol
    private var cancellable = Set<AnyCancellable>()
    init(combineNetworkManager: CombineNetworkableProtocol) {
        self.combineNetworkManager = combineNetworkManager
    }
    
    var customNetworkError : CustomNetworkError?
    
    func getProducts(withUrlString urlString:String){
        guard let url = URL(string: urlString) else {customNetworkError = .invalidUrlError ; return}
        combineNetworkManager.getData(withUrl: url)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("success")
                case .failure(let error):
                    switch error {
                    case is URLError :      self.customNetworkError = .invalidUrlError
                    case is DecodingError : self.customNetworkError = .parsingError
                    default:
                        let newError = error as? CustomNetworkError
                        self.customNetworkError = newError == .parsingError ? .parsingError : .dataNotFoundError
                    }
                    print("Opps something went wrong: ",self.customNetworkError?.errorDescription ?? "Some error")
                }
            } receiveValue: { (productModel:ProductModel) in
                
                self.productModel = productModel
                //self.products = productModel.products
                print(self.productModel!.products.count)
            }.store(in: &cancellable)


    }
}
