//
//  SuperPayDashboardInteractor.swift
//  MiniSuperApp
//
//  Created by 정채연 on 2022/08/21.
//

import ModernRIBs
import Combine
import Foundation

protocol SuperPayDashboardRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol SuperPayDashboardPresentable: Presentable {
    var listener: SuperPayDashboardPresentableListener? { get set }

    func updateBalance(_ balance: String)
}

protocol SuperPayDashboardListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

protocol SuperPayDashboardInteractorDependency {
    var balence: ReadOnlyCurrentValuePublisher<Double> { get }
    var balenceFormatter: NumberFormatter { get }
}

//Interactor에서 UI를 업데이트할 때는 presenter를 이용한다.
final class SuperPayDashboardInteractor: PresentableInteractor<SuperPayDashboardPresentable>, SuperPayDashboardInteractable, SuperPayDashboardPresentableListener {

    weak var router: SuperPayDashboardRouting?
    weak var listener: SuperPayDashboardListener?
    
    private let dependency: SuperPayDashboardInteractorDependency
    private var cancellables: Set<AnyCancellable>
    
    init(
        presenter: SuperPayDashboardPresentable,
        dependency: SuperPayDashboardInteractorDependency // 변경사항이 생기고 그에대한 수정사항을 줄이기 위해 protocol인 dependency 생성
    ) {
        self.dependency = dependency
        self.cancellables = .init()
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
       
        dependency.balence.sink{ [weak self] balance in
        self?.dependency.balenceFormatter.string(from: NSNumber(value: balance)).map({
                self?.presenter.updateBalance(String($0))
            })
        }.store(in: &cancellables)
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
