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
    private let viewModel: RMSearchViewViewModel
    private let searchView: RMSearchView
    
    // MARK: - init(s).
    
    init(config: RMConfig) {
        let viewModel = RMSearchViewViewModel(config: config)
        self.viewModel = viewModel
        self.searchView = RMSearchView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.config.type.title
        view.backgroundColor = .systemBackground
        
        [searchView].forEach(self.view.addSubview)
        addConstraints()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapExecuteSearch))
    }
    
    @objc private func didTapExecuteSearch() {
        print("click")
        // viewModel.executeSearch()
    }
    
    // MARK: - Private function(s).
    private func addConstraints() {
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
