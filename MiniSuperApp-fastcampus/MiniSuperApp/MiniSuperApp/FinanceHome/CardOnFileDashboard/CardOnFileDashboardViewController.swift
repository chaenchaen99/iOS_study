//
//  CardOnFileDashboardViewController.swift
//  MiniSuperApp
//
//  Created by 정채연 on 2022/09/12.
//

import ModernRIBs
import UIKit

//1.viewController에서 유저 액션이 발생하면 vc는 presentable listener에게 알려야한다.(objc addButtonDidTap)으로
//2. 다음은 CardOnFileDashboardInteractor가 대시보드를 구현해주어야 한다.
protocol CardOnFileDashboardPresentableListener: AnyObject {
    func didTapAddPaymentMethod()
}

final class CardOnFileDashboardViewController: UIViewController, CardOnFileDashboardPresentable, CardOnFileDashboardViewControllable {

    weak var listener: CardOnFileDashboardPresentableListener?
    
    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.text = "카드 및 계좌"
        return label
    }()
    
    private lazy var seeAllButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("전체보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let cardOnFileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var addMethodButton: AddPaymentMethodButton = {
        let button = AddPaymentMethodButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.roundCorners()
        button.backgroundColor = .systemGray4
        button.addTarget(self, action: #selector(addButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    func update(with viewModels: [PaymentMethodViewModel]){
        cardOnFileStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        // [PaymentMethodViewModel] -> [PaymentMethodView]
        // 데이터의 변환은 map / flatmap을 사용하면 간결하게 표현 가능하다.
        let views = viewModels.map(PaymentMethodView.init)
        
        views.forEach{
            $0.roundCorners()
            cardOnFileStackView.addArrangedSubview($0)
        }
        
        cardOnFileStackView.addArrangedSubview(addMethodButton)
        
        let heightConstraints = views.map { $0.heightAnchor.constraint(equalToConstant: 60)}
        NSLayoutConstraint.activate(heightConstraints)
    }
    
    private func setupViews(){
        view.addSubview(headerStackView)
        view.addSubview(cardOnFileStackView)
        
        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(seeAllButton)
        
      
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            cardOnFileStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 10),
            cardOnFileStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardOnFileStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardOnFileStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addMethodButton.heightAnchor.constraint(equalToConstant: 60),
            
        
        ])
    }
        
    @objc
    private func seeAllButtonTapped(){
            
    }
    
    @objc
    private func addButtonDidTap(){
        listener?.didTapAddPaymentMethod()
    }
}
