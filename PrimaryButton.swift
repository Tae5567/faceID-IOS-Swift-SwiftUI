//
//  PrimaryButton.swift
//  FaceID_Authetication
//
//   Created by Eyitayo Ayodeji cc 2023
//

import SwiftUI

struct PrimaryButton: View {
    var image: String?
    var showImage = true
    var text: String
    var body: some View {
        HStack{
            if showImage {
                Image(systemName: image ?? "person.fill")
            }
            Text(text)
        }
        .padding()
        .padding(.horizontal)
        .background(.white)
        .cornerRadius(30)
        .shadow(radius:30)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(image: "faceid", text: "Login with FaceID")
    }
}
