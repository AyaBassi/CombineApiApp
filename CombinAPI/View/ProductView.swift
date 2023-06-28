//
//  ProductView.swift
//  CombinAPI
//
//  Created by Payam Karbassi on 27/06/2023.
//

import SwiftUI
import CoreData

struct ProductView: View {
    @StateObject var productVM = ProductViewModel(combineNetworkManager: CombineNetworkManager())
    @EnvironmentObject var coordinator : Coordinator
    //@Environment(\.managedObjectContext) private var viewContext
    
    //    @FetchRequest(
    //        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    //        animation: .default)
    //private var items: FetchedResults<Item>
    
    var body: some View {
        VStack{
            customNavBar
            productList
        }
    }
    
    var customNavBar: some View{
        HStack(alignment:.center){
            Text("Product List")
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.tertiarySystemGroupedBackground))
    }
    
    var productList: some View {
        ScrollView{
            VStack(alignment:.leading){
                ForEach(productVM.productModel?.products ?? []) { product in
                    Button {
                        DispatchQueue.main.async {
                            coordinator.goToProductInfoScreen()
                        }
                        
                    } label: {
                        HStack(alignment:.top) {
                            
                            if let url = URL(string: product.thumbnail) {
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .empty : ProgressView()
                                    case .success(let image):
                                        image.resizable()
                                            .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
                                            .cornerRadius(10)
                                    case .failure:
                                        Image(systemName: "person.fill")
                                    default:
                                        Image(systemName: "person.fill")
                                    }
                                }
                            }
                            VStack(alignment:.leading){
                                Text(product.brand).font(Font.title)
                                Text(product.title).font(Font.body)
                                Text("Rating: \(product.rating.formatted())")
                                Spacer()
                                Text("$ \(product.price)").font(Font.title)
                            }
                    }

                    }
                    Divider()

                }
            }
            .frame(maxWidth:.infinity ,maxHeight:.infinity)
            .padding(4)
            
            .onAppear {
                print("Calling Api")
                productVM.getProducts(withUrlString: APIEndPoint.dummyJsonProductAPI)
            }
        }
    }
        
}


struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        //        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        ProductView()
    }
}
