//
//  UserRow.swift
//  callBack_swiftUI
//
//  Created by Tung Viet on 08/11/2023.
//

import SwiftUI

struct UserRow: View {
    var user: User

    var body: some View {
        HStack {
            user.avatar
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            Text("\(user.name)")
            Text("\(user.age)")
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: dataUser[0])
    }
}
