import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService {
    /// Share singleton instance
    static let shared = RMService()
    
    /// Privatized construtor
    private init() { }
    
    /// Send Ricky and Morty API Call
    /// - Parameters:
    ///   - request: Request Instance
    ///   - type: The type of object we expected to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        
    }
}
