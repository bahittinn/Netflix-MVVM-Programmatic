//
//  APICaller.swift
//  Netflix-MVVM-Programmatic
//
//  Created by Bahittin on 19.09.2023.
//

struct Constants {
    static let API_KEY = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZjFjNzlmMDY5YjM4ZDI1NmMzYmExOTY2MDlkNDQ3ZCIsInN1YiI6IjY0Zjc2N2I1MWI3MjJjMDEzYTI1NjQyZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vgMLzRMlTPrFzjc1HJqaphrO4UMJaMCvCMfkpFr1Xls"
    
    static let baseUrl = "https://api.themoviedb.org"
    
    static   let headers = [
        "accept": "application/json",
        "Authorization": "Bearer \(Constants.API_KEY)"
      ]
    
}

import Foundation

class APICaller {
    static let shared = APICaller()
    
    func makeRequest(with url: String) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.headers
        return request
    }
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let request =  makeRequest(with: "\(Constants.baseUrl)/3/trending/movie/day?language=en-US")

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                completion(.success(results.results))
    
            } catch {
                completion(.failure(error))
            }
            
        })

        dataTask.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Tv], Error>) -> Void) {
        let request =  makeRequest(with: "\(Constants.baseUrl)/3/trending/tv/day?language=en-US")

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
                completion(.success(results.results))
    
            } catch {
                completion(.failure(error))
            }
            
        })

        dataTask.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let request =  makeRequest(with: "\(Constants.baseUrl)/3/movie/upcoming?language=en-US&page=1")

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                completion(.success(results.results))
    
            } catch {
                completion(.failure(error))
            }
            
        })

        dataTask.resume()
    }
    
    
}
