import UIKit

class SizeHelper {
    static func calculateSize(view: UIView, width: CGFloat = 100, height: CGFloat = 1000) -> CGSize {
        let targetSize = CGSize(width: width, height: height)
        let size = view.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .fittingSizeLevel, verticalFittingPriority: .fittingSizeLevel)
        
        return size
    }
}
