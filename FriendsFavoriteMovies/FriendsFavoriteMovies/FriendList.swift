//
//  FriendList.swift
//  FriendsFavoriteMovies
//
//  Created by Curtis on 2024/7/1.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Friend.name) private var friends: [Friend]
    
    @State private var newFriend: Friend?
    
    var body: some View {
        NavigationSplitView {
            Group {
                if !friends.isEmpty {
                    List {
                        ForEach(friends) { friend in
                            NavigationLink {
                                Text(friend.name)
                                    .navigationTitle("Friends")
                            } label: {
                                Text(friend.name)
                            }
                        }
                        .onDelete(perform: deleteFriends(offsets:))
                    }
                } else {
                    ContentUnavailableView("No Friends", systemImage: "person.and.person")
                }
            }
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addFriend, label: {
                        Label("Add Item", systemImage: "plus")
                    })
                }
            }
            .sheet(item: $newFriend) { friend in
                NavigationStack {
                    Text("New friend")
                }
                .interactiveDismissDisabled()
            }
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
        }
    }
    
    private func addFriend() {
        withAnimation {
            let newItem = Friend(name: "")
            modelContext.insert(newItem)
            newFriend = newItem
        }
    }
    
    private func deleteFriends(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(friends[index])
        }
    }
}

#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}
