//
//  ContentView.swift
//  PartenoKitSwiftUI
//
//  Created by Ignazio Finizio on 21/10/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var sTeam = ""
    @State var sTag = ""
    @State var sKey = ""
    @State var sVal = ""
    @State var p = ParthenoKit()
    
    var body: some View {
        TabView{
            WriteView(sTeam: $sTeam, sTag: $sTag, sKey: $sKey, sVal: $sVal, p: $p)
                .tabItem {
                    Text("Scrittura")
                    Image(systemName: "icloud.and.arrow.up")
                }
            ReadView(sTeam: $sTeam, sTag: $sTag, sKey: $sKey, sVal: $sVal, p: $p)
                .tabItem {
                    Text("Lettura")
                    Image(systemName: "icloud.and.arrow.down")
                }
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
