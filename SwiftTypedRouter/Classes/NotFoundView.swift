//
//  NotFoundView.swift
//  SwiftTypedRouter
//
//  Created by Sam Dean on 04/02/2020.
//

import Foundation
import SwiftUI

@available(iOS 13.0.0, *)
struct NotFoundView: View {

    let path: String
    let router: Router

    private func spacer(_ size: CGFloat) -> some View {
        Spacer().frame(height: size)
    }

    var body: some View {
        ScrollView {
            VStack {
                Group {
                    Text("404: Not Found").font(.largeTitle)
                    Text("no route matches ") + Text(path).font(.headline)
                }
                spacer(40)
                Group {
                    Text("Known Routes").font(.headline)
                    spacer(10)
                    ForEach(router.routes, id: \.description) {
                        $0.debugView()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                            .padding(.horizontal)
                    }
                }
                spacer(40)
                Group {
                    Text("Known Aliases").font(.headline)
                    spacer(10)
                    ForEach(router.aliases, id: \.identifier) {
                        $0.debugView()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                            .padding(.horizontal)
                    }
                }
                spacer(20)
            }
            .padding()
        }
        .navigationBarTitle("404: Not Found")
    }
}

@available(iOS 13.0.0, *)
struct NotFoundView_Previews: PreviewProvider {

    private static let router: Router = {
        let router = Router()
        router.add(path: "home", action: { Text("Sigh") })
        router.add(path: "product/details/:id", action: { (id: String) in Text("Sigh") })
        router.alias(Alias<Void>("prodcut/detalis/:id")) { "" }
        return router
    }()

    static var previews: some View {
        NavigationView {
            NotFoundView(path: "notfound/product/list/1", router: router)
        }
    }
}
