//
//  ContentView.swift
//  MyToDo
//
//  Created by Lesley Lopez on 9/26/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var toDoText = ""
    
    //This connects us to our database essentially
    @Environment(\.modelContext) private var context
    
    // This line keeps track of all the data in our db
    @Query private var tasks: [Task]
    
    var body: some View {
        ZStack {
            Color(red: 250/255, green: 218/255, blue: 221/255)
            
            VStack {
                Text("My To Do List")
                    .font(.title)
                    .bold()
                    .padding(.top, 40)
                    .foregroundStyle(.white)
                
                List(tasks){ task in
                    HStack {
                        Text(task.task)
                        Spacer()
                        Button {
                            context.delete(task)
                        } label: {
                            Image(systemName:"trash")
                        }
                    }
                }
                .listStyle(.plain)
                
                HStack {
                    TextField("Enter a to do", text: $toDoText)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 2)
                    Button(action: {
                        let newItem = Task()
                        newItem.task = toDoText
                        context.insert(newItem)
                        toDoText = ""
                    }, label: {
                        Image(systemName: "plus.rectangle.fill")
                    })
                }
                .padding()
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
