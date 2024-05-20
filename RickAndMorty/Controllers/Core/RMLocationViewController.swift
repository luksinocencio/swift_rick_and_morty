import UIKit

/// Controller to show and search for Location
final class RMLocationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Locations"
        view.backgroundColor = .systemBackground
        setupNavigationItemRightButton()
    }
    
    private func setupNavigationItemRightButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapShare))
    }
    
    // MARK: - Selector(s).
    
    @objc
    private func didTapShare() {
        
    }
}
