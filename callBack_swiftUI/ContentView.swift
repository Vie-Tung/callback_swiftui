//
//  ContentView.swift
//  callBack_swiftUI
//
//  Created by Tung Viet on 08/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var users: [User] = dataUser
    @State private var isShowingCreateView = false

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: CreateView(onTapDone: { newUser in
                    users.insert(newUser, at: 0)
                }), isActive: $isShowingCreateView) {
                    
                }

                Button("Tap to show addNew") {
                    isShowingCreateView.toggle()
                }

                List(users, id: \.name) { user in
                    UserRow(user: user)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
