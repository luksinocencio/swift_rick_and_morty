import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({ self.addSubview($0) })
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        clipsToBounds = true
    }
}

extension UIDevice {
    /// Check if current device is phone idiom
    static let isiPhone = UIDevice.current.userInterfaceIdiom == .phone
}
