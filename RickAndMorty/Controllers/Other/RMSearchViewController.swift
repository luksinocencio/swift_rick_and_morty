import UIKit

// Dynamic search option view
// Render results
// Render no results zero state
// Searching / API Call

/// Configurable controller to search
class RMSearchViewController: UIViewController {
    /// Configuration for search session
    struct RMConfig {
        enum `Type` {
            case character  // name | status | gender
            case episode    // name
            case location   // name | type
            
            var title: String {
                switch self {
                case .character:
                    return "Search Characters"
                case .location:
                    return "Search Location"
                case .episode:
                    return "Search Episode"
                }
            }
        }
        
        let type: `Type`
    }
    
    // MARK: - Private Property(ies).
    private let config: RMConfig
    
    
    // MARK: - init(s).
    
    init(config: RMConfig) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = config.type.title
        view.backgroundColor = .systemBackground
    }
}
