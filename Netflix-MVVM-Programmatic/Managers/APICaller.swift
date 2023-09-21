//
//  APICaller.swift
//  Netflix-MVVM-Programmatic
//
//  Created by Bahittin on 19.09.2023.
//

import Foundation


struct Constants {
    static let API_KEY = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZjFjNzlmMDY5YjM4ZDI1NmMzYmExOTY2MDlkNDQ3ZCIsInN1YiI6IjY0Zjc2N2I1MWI3MjJjMDEzYTI1NjQyZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vgMLzRMlTPrFzjc1HJqaphrO4UMJaMCvCMfkpFr1Xls"
    
    static let baseUrl = "https://api.themoviedb.org"
    
    static   let headers = [
        "accept": "application/json",
        "Authorization": "Bearer \(Constants.API_KEY)"
      ]
}

enum APIError: Error {
    case failedTogetData
}

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
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        let request =  makeRequest(with: "\(Constants.baseUrl)/3/trending/movie/day?language=en-US")

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
    
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        })

        dataTask.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        let request =  makeRequest(with: "\(Constants.baseUrl)/3/trending/tv/day?language=en-US")

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
    
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        })

        dataTask.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        let request =  makeRequest(with: "\(Constants.baseUrl)/3/movie/upcoming?language=en-US&page=1")

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
    
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        })

        dataTask.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        let request =  makeRequest(with: "\(Constants.baseUrl)/3/movie/popular?language=en-US&page=1")

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
    
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        })

        dataTask.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        let request =  makeRequest(with: "\(Constants.baseUrl)/3/movie/top_rated?language=en-US&page=1")

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
    
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        })

        dataTask.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        let request =  makeRequest(with: "\(Constants.baseUrl)/3/movie/top_rated?language=en-US&page=1")

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
    
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        })

        dataTask.resume()
    }
    
}
