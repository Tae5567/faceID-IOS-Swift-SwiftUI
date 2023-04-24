//
//  ContentView.swift
//  FaceID_Authetication
//
//   Created by Eyitayo Ayodeji cc 2023
//

import SwiftUI

struct ContentView: View {
    @StateObject var authenticationManager = AuthenticationManager()
    var body: some View {
        NavigationView {
            VStack{
                if authenticationManager.isAuthenticated {
                    VStack(spacing: 40){
                        Title()
                        
                        Text("Welcome! You are now signed in.")
                            .foregroundColor(.white)
                        
                        PrimaryButton(showImage: false, text: "Log out")
                            .onTapGesture {
                                authenticationManager.logout()
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(LinearGradient(colors: [.brown, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                } else{
                    LoginView()
                        .environmentObject(authenticationManager)
                }
                   
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .alert(isPresented:$authenticationManager.showAlert) {
                    Alert(title: Text("Error"), message: Text(authenticationManager.errorDescription ?? "Aunthentication failed. Please try again."), dismissButton: .default(Text("Ok") ) )
            }
        }
        }
       
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
