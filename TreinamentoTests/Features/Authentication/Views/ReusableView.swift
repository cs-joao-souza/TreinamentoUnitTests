import UIKit

class ReusableView: UIView, CodableView {
    
    let labelMessage: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = """
                        Essa mensagem é para um componente que será reutilizado
                        em todo o projeto.
                     """
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center

        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        backgroundColor = UIColor.red
    }
    
    func buildViewHierarchy() {
        addSubview(labelMessage)
    }
    
    func buildConstraints() {
        labelMessage.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
            make.trailing.bottom.equalToSuperview().offset(-10)
        }
    }
}
