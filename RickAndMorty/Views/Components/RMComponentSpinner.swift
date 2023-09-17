import UIKit

class RMComponentSpinner: UIActivityIndicatorView {
    override init(style: UIActivityIndicatorView.Style) {
        super.init(style: style)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.style = .large
        hidesWhenStopped = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
