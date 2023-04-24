//
//  Title.swift
//  FaceID_Authetication
//
//   Created by Eyitayo Ayodeji cc 2023
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Health App")
            .bold()
            .font(.title)
            .foregroundColor(.white)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
            .background(LinearGradient(colors: [.brown, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}
