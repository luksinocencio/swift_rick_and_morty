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
    ///   - completion: Callback with data or error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}
