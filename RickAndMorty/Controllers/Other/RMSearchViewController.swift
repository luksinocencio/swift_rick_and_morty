import UIKit

/// Configurable controller to search
class RMSearchViewController: UIViewController {
    struct RMConfig {
        enum `Type` {
            case character
            case episode
            case location
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
    
    // MARK: - Life cyclye.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        view.backgroundColor = .systemBackground
    }
}
