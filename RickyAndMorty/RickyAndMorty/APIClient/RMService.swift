import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService {
    /// Share singleton instance
    static let shared = RMService()
    
    /// Privatized construtor
    private init() { }
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Ricky and Morty API Call
    /// - Parameters:
    ///   - request: Request Instance
    ///   - type: The type of object we expected to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            // Decode response
            
            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
//                print(String(describing: json))
                let results = try JSONDecoder().decode(type.self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
        })
        
        task.resume()
    }
    
    // MARK: - Private
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
