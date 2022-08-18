//
//  GroupSelector.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 22.11.2021.
//

import SwiftUI

struct GroupSelector: View {
    
    @EnvironmentObject var VM: GroupSelectorViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 16){
                if(VM.genres.count>0){
                    ForEach(VM.genres, id: \.self) { group in
                        
                        Button(
                            action: {
                                
                            },
                            label: {
                                Text(group.title_ru!).foregroundColor(Color("primary text")).fontWeight(.light)
                            }
                        )
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(Color("Accent"))
                        .foregroundColor(Color("primary text"))
                        .cornerRadius(16)
                        
                    }
                }
            }.padding(.horizontal, 24)
        }
        .padding(.horizontal, -24)
    }
}
