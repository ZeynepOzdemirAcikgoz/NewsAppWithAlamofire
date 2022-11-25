//
//  NewsViewModel.swift
//  NewsAppSwiftUI
//
//  Created by Zeynep Özdemir Açıkgöz on 29.09.2022.
//

import Foundation
import Alamofire
import UIKit



class NewsViewModel : ObservableObject{  //değişiklikleri bağlı olduğu yapılarda değiştirip kullanıcıya gösterebileceğiz 

    @Published var news = [Result]() // @published yaparak değişikleri ContentView içerisinde gözlemleyebiliyoruz
    @Published var images = [Result]()
    init(){
        getNews()
    }
    
    func getNews(count : Int = 1){
        
        let headers:HTTPHeaders = [
                    "Authorization": "apikey 7fQULnOFAfxSwMm11hgjmM:56jPvRAnDpjnbJMFgXaZDD",
                    "Accept": "application/json",
                    "Content-Type": "application/json" ]

        AF.request("https://api.collectapi.com/news/getNews?country=tr&tag=general",method: .get, headers:headers).responseDecodable(of: Welcome.self){
            response in
            
            switch response.result{
            case.success(let data) :
                let result = data.result
                self.news += result!
               // self.imageView.image = UIImage(data: result!, scale: 1)
            case.failure(let error):
                print (error)
            }
            
            
        }
      

    }
    
}
