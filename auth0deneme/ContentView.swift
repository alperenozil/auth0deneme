//
//  ContentView.swift
//  auth0deneme
//
//  Created by Necdet Alperen Özil on 6.05.2021.
//

import SwiftUI
import Auth0

struct ContentView: View {
    var body: some View {
        Button("Login") {
            Auth0
                .webAuth()
                .scope("openid profile")
                .audience("https://alperen.us.auth0.com/userinfo")
                .start { result in
                    switch result {
                    case .failure(let error):
                        // Handle the error
                        print("Error: \(error)")
                    case .success(let credentials):
                        // Do something with credentials e.g.: save them.
                        // Auth0 will automatically dismiss the login page
                        print("Credentials: \(credentials.idToken)")
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
