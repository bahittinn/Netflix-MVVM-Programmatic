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
    
    static let YoutubeAPI_Key = "AIzaSyDmSXwOuX0yy5fpebTxzz_g41wRMxD2vOc"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
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
    
    func search(with query: String,completion: @escaping (Result<[Title], Error>) -> Void) {
        let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let request =  makeRequest(with: "\(Constants.baseUrl)/3/search/movie?query=\(query!)")

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
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constants.YoutubeBaseURL)q=\(query)&key=\(Constants.YoutubeAPI_Key)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                
                completion(.success(results.items[0]))
            } catch {
                completion(.failure(error))
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
        
    }
    
}
