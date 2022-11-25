//
//  ContentView.swift
//  NewsAppSwiftUI
//
//  Created by Zeynep Özdemir Açıkgöz on 29.09.2022.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @ObservedObject var newsVM = NewsViewModel() //  NewsViewModel den @ObservedObject gözlemlenen obje oluşturuyoruz
    
    var body: some View {
        NavigationView {
        
            List(newsVM.news, id: \.id) { element in
                VStack{
                    AsyncImage(url: URL(string: element.image!)).frame(width:300, height: 250, alignment:.center)
                        .cornerRadius(30, antialiased: true)
                        
                    Text(element.resultDescription!).foregroundColor(.cyan)
                        .padding()
                    Text(element.source!)
                        .font(.body).italic().foregroundColor(.gray)
        
                }
                
            }.toolbar{
            Button(action:addNews) {
                    Text("Get New News").foregroundColor(.red)
                }
            }
            
            .navigationTitle(Text("NEWS APP"))
        }
    }
    func addNews(){
        newsVM.getNews(count: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
