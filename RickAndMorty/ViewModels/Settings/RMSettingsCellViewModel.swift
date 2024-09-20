import UIKit

struct RMSettingsCellViewModel: Identifiable, Hashable {
    let id = UUID()
    
    // MARK: - Private property(ies).
    private let type: RMSettingsOption
    
    // MARK: - Public property(ies).
    public var image: UIImage? {
        return type.iconImage
    }
    
    public var title: String {
        return type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
    
    // MARK: - init(s).
    init(type: RMSettingsOption) {
        self.type = type
    }
}
