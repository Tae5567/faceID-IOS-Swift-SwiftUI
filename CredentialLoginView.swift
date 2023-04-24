//
//  CredentialLoginView.swift
//  FaceID_Authetication
//
//  Created by Sena Ayodeji on 18/04/2023.
//

import SwiftUI

struct CredentialLoginView: View {
    @EnvironmentObject var authenticationManager: AuthenticationManager
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 40){
            Title()
            
            TextField("Username", text: $username)
            
            SecureField("Password", text: $password)
            
            PrimaryButton(showImage: false, text: "Log in")
                .onTapGesture {
                    authenticationManager.authenticateWithCredentials(username: username, password: password)
                }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.brown, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct CredentialLoginView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialLoginView()
            .environmentObject(AuthenticationManager())
    }
}
