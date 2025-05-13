import Foundation

// Responsabilities
// - show search results
// - show no results view
// - kick off API requests

final class RMSearchViewViewModel {
    let config: RMSearchViewController.RMConfig
    
    init(config: RMSearchViewController.RMConfig) {
        self.config = config
    }
}
