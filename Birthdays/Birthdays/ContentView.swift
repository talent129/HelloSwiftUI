//
//  ContentView.swift
//  Birthdays
//
//  Created by Curtis on 2024/7/1.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Friend.birthday) private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newData = Date.now
    
    var body: some View {
        NavigationStack {
            List(friends) { friend in
                HStack {
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }
                    Text(friend.name)
                        .bold(friend.isBirthdayToday)
                    Spacer()
                    Text(friend.birthday, format: .dateTime)
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    
                    DatePicker(selection: $newData, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newData)
                        context.insert(newFriend)
                        
                        newName = ""
                        newData = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
        
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
