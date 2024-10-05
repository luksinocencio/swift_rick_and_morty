import UIKit

/// Controller to show and search for Location
final class RMLocationViewController: UIViewController {
    private let primaryView = RMLocationView()
    private let viewModel = RMLocationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        title = "Locations"
        view.backgroundColor = .systemBackground
        
        addSearchButton()
        addConstraints()
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .search,
            target: self,
            action: #selector(didTapShare)
        )
    }
    
    private func addConstraints() {
        [primaryView].forEach(view.addSubview)
        
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            primaryView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    // MARK: - Selector(s).
    
    @objc
    private func didTapShare() {
        print("click header button")
    }
}
