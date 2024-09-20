import UIKit

/// Controller to show various app options and settings
final class RMSettingsViewController: UIViewController {
    
    // MARK: - Private property(ies).
    private let viewModel = RMSettingsViewViewModel(
        cellViewModels: RMSettingsOption.allCases.compactMap({
            return RMSettingsCellViewModel(type: $0)
        })
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        view.backgroundColor = .systemBackground
    }
}
