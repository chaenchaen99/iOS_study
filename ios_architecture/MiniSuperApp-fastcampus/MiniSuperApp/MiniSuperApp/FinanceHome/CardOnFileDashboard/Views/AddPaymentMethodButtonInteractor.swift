//
//  AddPaymentMethodButtonInteractor.swift
//  MiniSuperApp
//
//  Created by 정채연 on 2022/09/12.
//

import ModernRIBs

protocol AddPaymentMethodButtonRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol AddPaymentMethodButtonPresentable: Presentable {
    var listener: AddPaymentMethodButtonPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol AddPaymentMethodButtonListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class AddPaymentMethodButtonInteractor: PresentableInteractor<AddPaymentMethodButtonPresentable>, AddPaymentMethodButtonInteractable, AddPaymentMethodButtonPresentableListener {

    weak var router: AddPaymentMethodButtonRouting?
    weak var listener: AddPaymentMethodButtonListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: AddPaymentMethodButtonPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
