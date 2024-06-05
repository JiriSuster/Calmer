//
//  AddNoteContentView.swift
//  Calmer
//
//  Created by Jiří Daniel Šuster on 05.06.2024.
//

import SwiftUI
//kazda zprava ma 
struct AddNoteContentView: View {
    @State var selectedEmoji = "😐"
    var body: some View {
        NavigationView {

                    VStack{
                        HStack{
                            Text("Name")
                            TextField("Value", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        }
                        SelectMoodContentView()
                        HStack{
                            Text("Description")

                            TextField("Placeholder", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/,axis: .vertical).padding(10)
                            
                        }
                        
                        
                    }
                    .toolbar{
                        ToolbarItem(placement: .topBarLeading){
                            NavigationLink{
                                NotesContentView().navigationBarBackButtonHidden(true)
                            } label: {
                                Text("Cancel")
                            }
                        }
                        
                        ToolbarItem(placement: .principal) {
                                            Text("New note")
                                .font(.body)
                                        }
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button("Save") {
                                /*TODO ONCLICK*/
                            }
                        }
                    }
                }
    }
}
#Preview {
    AddNoteContentView()
}
