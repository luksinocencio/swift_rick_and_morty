import Foundation

final class RMLocationViewModel {
    
    // MARK: - Private Property(ies).
    
    private var locations: [RMLocation] = []
    
    // Location response info
    // Will contain next url, if present
    
    private var cellViewModels: [String] = []
    
    // MARK: Init(s).
    
    init() { }
    
    // MARK: - Public Function(s).
    
    public func fetchLocations() {
        RMService.shared.execute(.listLocationsRequest, expecting: String.self) { result in
            switch result {
            case .success(let success):
                break
            case .failure(let failure):
                break
            }
        }
    }
    
    // MARK: - Private Function(s).
    
    private var hasMoreResults: Bool {
        return false
    }
}

