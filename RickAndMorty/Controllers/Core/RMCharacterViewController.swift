import UIKit

/// Controller to show and search for Character
final class RMCharacterViewController: UIViewController {
    // MARK: - Private Property(ies).
    
    private let characterListView = RMCharacterListView()
    
    // MARK: - Life cycle.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupCharacterListView()
        setupNavigationItemRightButton()
    }
    
    // MARK: - Private Function(s).
    
    private func setup() {
        title = "Characters"
        view.backgroundColor = .systemBackground
    }
    
    private func setupCharacterListView() {
        characterListView.delegate = self
        view.addSubview(characterListView)
        
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            characterListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        ])
    }
    
    private func setupNavigationItemRightButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapShare))
    }
    
    // MARK: - Selector(s).
    
    @objc
    private func didTapShare() {
        let vc = RMSearchViewController(config: RMSearchViewController.RMConfig(type: .character))
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - RMCharacterListViewDelegate

extension RMCharacterViewController: RMCharacterListViewDelegate {
    func rmCharacterListView(_ characterListView: RMCharacterListView, didSelecteCharacter character: RMCharacter) {
        // Open detail controller for that character
        let viewModel = RMCharacterDetailViewViewModel(character: character)
        let detailVC = RMCharacterDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
