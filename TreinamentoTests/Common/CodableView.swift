import Foundation

protocol CodableView {
    func configureView()
    func buildViewHierarchy()
    func buildConstraints()
}

extension CodableView {
    func setup() {
        configureView()
        buildViewHierarchy()
        buildConstraints()
    }
}
