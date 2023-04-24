//
//  LoginView.swift
//  FaceID_Authetication
//
//  Created by Eyitayo Ayodeji cc 2023
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authenticationManager:
        AuthenticationManager
    
    var body: some View {
        VStack(spacing: 40){
            Title()
            
            switch authenticationManager.biometryType{
            case .faceID: PrimaryButton(image: "faceid", text: "Login with FaceID")
                    .onTapGesture {
                        Task.init{
                            await
                            authenticationManager.autheticatewithBiometrics()
                        }
                    }
            case .touchID:
                PrimaryButton(image: "touchid", text: "Login with TouchID")
                    .onTapGesture {
                        Task.init{
                            await
                            authenticationManager.autheticatewithBiometrics()
                        }
                    }
            default:
                NavigationLink {
                    CredentialLoginView()
                        .environmentObject(authenticationManager)
                    
                } label: {
                    PrimaryButton(image: "person.fill", text: "Login with password")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.brown, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthenticationManager())
    }
}
