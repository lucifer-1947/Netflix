//
//  ApiCaller.swift
//  Netflix
//
//  Created by Raj Guggilla on 09/02/24.
//

import Foundation

class ApiCaller {

    enum ApiError : Error {
        
        case failedToGetData
    }
    static let shared = ApiCaller()
    
    let headers = [
     "accept": "application/json",
     "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmM2M5YTFkMjA4ZTczYTM2MDFhNDQ3MDczY2U2MTNlNyIsInN1YiI6IjY1YzYwYzFmZmQ3YWE0MDE2MTk4MmE0OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2Xc7H-t5RbUrLWkcv9EnVc8Ch-tNswwCrvj1mNXOTZ8"
    ]
    
    func getTrendingMovies(completion:@escaping (Result<[Title],ApiError>)->Void ) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/trending/movie/day?language=en-US")! as URL,
                                               cachePolicy: .useProtocolCachePolicy,
                                           timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            guard let data = data , error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            do {

                let trendingMoviesResponse = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                
                completion(.success(trendingMoviesResponse.results))

            }
            catch {

                completion(.failure(ApiError.failedToGetData))
            }
        })
        
        dataTask.resume()
        
    }
    
    
    func getTrendingTv(completion: @escaping (Result<[Title],ApiError>) -> Void ) {
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/trending/tv/day?language=en-US")! as URL,
                                               cachePolicy: .useProtocolCachePolicy,
                                           timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
            guard let data = data , error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            
            do {
                
                let trendingTvResponse =  try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                
                completion(.success(trendingTvResponse.results))
                
            }
            catch {
                completion(.failure(.failedToGetData))
            }
        }
        
        dataTask.resume()
        
    }
    
    
    func getUpcoming(completion: @escaping (Result<[Title],ApiError>) -> Void ) {
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1")! as URL,
                                               cachePolicy: .useProtocolCachePolicy,
                                           timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
            guard let data = data , error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            
            do {
                let upcoming =  try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                
               
                completion(.success(upcoming.results))
                
            }
            catch {
                completion(.failure(.failedToGetData))
            }
        }
        
        dataTask.resume()
        
    }
    
    
    
    func getPopular(completion: @escaping (Result<[Title],ApiError>) -> Void ) {
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1")! as URL,
                                               cachePolicy: .useProtocolCachePolicy,
                                           timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
            guard let data = data , error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            
            do {
                let popular =  try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                
               
                completion(.success(popular.results))
                
            }
            catch {
                completion(.failure(.failedToGetData))
            }
        }
        
        dataTask.resume()
        
    }
    
    
    func getTopRated(completion: @escaping (Result<[Title],ApiError>) -> Void ) {
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")! as URL,
                                               cachePolicy: .useProtocolCachePolicy,
                                           timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
            guard let data = data , error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            
            do {
                let topRated =  try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                
               
                completion(.success(topRated.results))
                
            }
            catch {
                completion(.failure(.failedToGetData))
            }
        }
        
        dataTask.resume()
        
    }
    
    
    
    
    
    
  
    
}
