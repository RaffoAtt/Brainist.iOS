//
//  ReadView.swift
//  TestPartenoKitSwiftUI
//
//  Created by Ignazio Finizio on 22/10/2020.
//

import SwiftUI


struct ReadView: View {
    
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
                
                Text("Chiave (*) (usa % per l'elenco di tutte)")
                TextField("Inserisci la chiave univoca associata al valore", text: $sKey)
                    .padding(6)
                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .padding(3)
            }
            
            Spacer()
            
            Button(action: {
                let _ = p.read(team: sTeam, tag: sTag, key: sKey, completion: {ris in
                    DispatchQueue.main.async {
                        sVal =  ris as! String
                    }
                })
            })
            {
                Text("Leggi")
                    .padding(10)
                    .foregroundColor(.white)
            }.background(Color.black)
            Spacer()
            
            Group{
                Spacer()
                Text("Valore")
                if let valore = sVal {
                    Text(valore)
                        .padding(6)
                        .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .padding(3)
                }
                
                Spacer()
                Spacer()
                Text("(*) Obbligatorio")
                Spacer()
            }
        }
    }
}
