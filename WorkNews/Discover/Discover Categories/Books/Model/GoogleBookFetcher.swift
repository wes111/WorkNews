//
//  GoogleBookFetcher.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/17/22.
//

import Combine
import Foundation

class GoogleBookFetcher {

    private let decoder = JSONDecoder()
    private let api = GoogleAPI()
    
    // This could have an initial value provided from local storage.
    private let googleBooksSubject = CurrentValueSubject<GoogleBooksResponseModel?, Never>(nil)
    private let googleBookCountSubject = CurrentValueSubject<Int?, Never>(nil)
    
    private let googleBookUpdateSubject = PassthroughSubject<GoogleBook?, Never>()
    
    private var fetchedBookCount = 0
    private let shouldFetchAllBooks = false
    
    init() {
        requestGoogleBookCount()
        requestGoogleBooks(startingAt: 0)
    }
    
    func getAdditionalBookDetails(id: String) {
        makeRequest(using: api.requestGoogleVolumeURL + id) { [weak self] data in
            do {
                let googleBook = try self?.decoder
                    .decode(GoogleBook.self, from: data)
                self?.googleBookUpdateSubject.send(googleBook)
            } catch {
                print(error)
            }
        }
    }
    
    func tryToFetchAllBooks(){
        guard let totalBooks = googleBookCountSubject.value else {
            // Add error logging here. This should not be possible.
            print("Error in GoolgeBookFetcher")
            return
        }
        while fetchedBookCount < totalBooks {
            requestGoogleBooks(startingAt: fetchedBookCount)
        }
    }
    
    private func requestGoogleBooks(startingAt index: Int) {
        makeRequest(using: api.requestGoogleBooksURL + String(index)) { [weak self] data in
            do {
                let googleBooksData = try self?.decoder
                    .decode(GoogleBooksResponseModel.self, from: data)
                self?.googleBooksSubject.send(googleBooksData)
            } catch {
                print(error)
            }
        }
        fetchedBookCount += api.defaultBooksPerFetch
    }
    
    private func requestGoogleBookCount() {
        makeRequest(using: api.requestGoogleBookCountURL) { [weak self] data in
            do {
                let googleBookCountData = try self?.decoder
                    .decode(GoogleBookShelfResponseModel.self, from: data)
                self?.googleBookCountSubject.send(googleBookCountData?.volumeCount)
            } catch {
                print(error)
            }
        }
    }
    
    func getGoogleBooksPublisher() -> AnyPublisher<GoogleBooksResponseModel?, Never> {
        return googleBooksSubject.eraseToAnyPublisher()
    }
    
    func getGoogleBookCountPublisher() -> AnyPublisher<Int?, Never> {
        return googleBookCountSubject.eraseToAnyPublisher()
    }
    
    func getGoogleBookUpdatePublisher() -> AnyPublisher<GoogleBook?, Never> {
        return googleBookUpdateSubject.eraseToAnyPublisher()
    }
    
    private func makeRequest(using urlString: String, handleData: @escaping (Data) -> ()) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let safeData = data {
                    handleData(safeData)
                } else {
                    print("Error receiving data from URL.")
                }
            }
            task.resume()
        }
    }
}

