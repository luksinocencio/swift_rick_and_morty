import UIKit

/// View for single character info
final class RMCharacterDetailView: UIView {
    // MARK: - Public Property(ies).
    public var collectionView: UICollectionView?
    
    // MARK: - Private Property(ies).
    private var spinner = RMComponentSpinner(style: .large)
    private var viewModel: RMCharacterDetailViewViewModel
    
    // MARK: - Init
    init(frame: CGRect, viewModel: RMCharacterDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        let collectionView = createColletionView()
        self.collectionView = collectionView
        addSubviews(collectionView, spinner)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public functions(s).
    
    public func configure(with viewModel: RMCharacterDetailViewViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Private function(s).
    
    private func addConstraints() {
        guard let collectionView = collectionView else { return }
        
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    private func createColletionView() -> UICollectionView {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.createSection(for: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(
            RMCharacterPhotoCollectionViewCell.self,
            forCellWithReuseIdentifier: RMCharacterPhotoCollectionViewCell.cellIdentifier
        )
        collectionView.register(
            RMCharacterInfoCollectionViewCell.self,
            forCellWithReuseIdentifier: RMCharacterInfoCollectionViewCell.cellIdentifier
        )
        collectionView.register(
            RMCharacterEpisodeCollectionViewCell.self,
            forCellWithReuseIdentifier: RMCharacterEpisodeCollectionViewCell.cellIdentifier
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }
    
    private func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection  {
        let sectionTypes = viewModel.sections
        switch sectionTypes[sectionIndex] {
        case .photo:
            return viewModel.createPhotoSectionLayout()
        case .information:
            return viewModel.createInfoSectionLayout()
        case .episodes:
            return viewModel.createEpisodesSectionLayout()
        }
        
    }
}
