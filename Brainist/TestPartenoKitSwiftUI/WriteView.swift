//
//  WriteView.swift
//  TestPartenoKitSwiftUI
//
//  Created by Ignazio Finizio on 22/10/2020.
//

import SwiftUI


struct WriteView: View {
    @Binding var sTeam: String
    @Binding var sTag: String
    @Binding var sKey: String
    @Binding var sVal: String
    @Binding var p: ParthenoKit
    
    var body: some View {
        VStack{
            Group{
                Text("Team (*)")
                TextField("Inserisci il nome del tuo team", text: $sTeam)
                    .padding(6)
                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .padding(3)
                
                Text("Tag")
                TextField("Inserisci un eventuale tag", text: $sTag)
                    .padding(6)
                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .padding(3)
                
                Text("Chiave (*)")
                TextField("Inserisci la chiave univoca associata al valore", text: $sKey)
                    .padding(6)
                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .padding(3)
                
                Text("Valore")
                TextField("Inserisci il valore da salvare", text: $sVal)
                    .padding(6)
                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .padding(3)
            }
            
            Spacer()
            Button(action: {
                let result = p.write(team: sTeam, tag: sTag, key: sKey, value: sVal, completion: { ris in
                    if ris{
                        DispatchQueue.main.async {
                            sVal = ""
                        }
                    }else{
                        print("errore durante il salvataggio")
                    }
                })
                if result == false {
                    print("errore durante il salvataggio")
                }
                
                
            }) {
                Text("Scrivi")
                    .padding(10)
                    .foregroundColor(.white)
            }.background(Color.black)
            Spacer()
            Text("(*) Obbligatorio")
            Spacer()
        }
    }
}
