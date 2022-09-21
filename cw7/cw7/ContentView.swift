//
//  ContentView.swift
//  cw7
//
//  Created by Ritaj Alhaddad on 10/09/2022.
//

import SwiftUI

struct CastMember : Identifiable {
    let id = UUID()

    let name : String
    let imageName : String
}
struct movieInfo: Identifiable{
    let id = UUID()
    
    let title: String
    let imageName: String
    let cast : [CastMember]
}

struct ContentView: View {
    let movies = [
        movieInfo(title: "shrek", imageName: "shrek" , cast: [CastMember(name: "shrek", imageName: "shrek") ]),
        movieInfo(title: "prison break", imageName: "prison break" , cast: [CastMember(name: "weliam", imageName: "prison break") ]),
        movieInfo(title: "home alone", imageName: "home alone" , cast: [CastMember(name: "kifin", imageName: "home alone") ])
        
    ]
    
    var body : some View{
        NavigationView {
            List{
                ForEach(movies) {movie in
                    NavigationLink(destination :
                                    moviedetail(movie: movie))  {
                        movielistitem(movie: movie)
                    }
                } .navigationTitle("movies")
            }
            .tint(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct movielistitem: View {
    let movie: movieInfo
    var body: some View{
        HStack{
            Image(movie.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            Text(movie.title)
        }
    }
}

struct moviedetail: View {
    let movie: movieInfo
    var body: some View{
        ZStack {
            Image(movie.imageName)
                .resizable()
                .blur(radius: 20)
                .opacity(0.5)
            
            VStack {
                Image(movie.imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text(movie.title)
                    .font(.largeTitle)
                HStack{
                    ForEach(movie.cast) { CastMember in
                        VStack{
                            Image(CastMember.imageName)
                            Text(CastMember.name)
                        }
                        
                        
                    }
                }
            }
        }
        .foregroundColor(.white)
        .ignoresSafeArea()
    }
}

