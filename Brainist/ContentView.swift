//
//  ContentView.swift
//  Brainist
//
//  Created by Raffaele Attanasio on 23/10/2020.
//



import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 190,height: 170, alignment: .center)
                .accessibility(hidden: true)

            Text("Welcome to")
                .bold()

            Text("Brainist")
                .customTitleText()
                .foregroundColor(.white)
        }
    }
}
struct TitleView_Preview: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
