//
//  ContentView.swift
//  H4R News
//
//  Created by Santhosh Kumar on 14/12/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)){
                 HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                    
                }
            }
            .navigationTitle("Hacker News")
        }.onAppear{
            networkManager.fetchData()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
