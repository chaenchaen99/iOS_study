//
//  AddPaymentMethodButtonRouter.swift
//  MiniSuperApp
//
//  Created by 정채연 on 2022/09/12.
//

import ModernRIBs

protocol AddPaymentMethodButtonInteractable: Interactable {
    var router: AddPaymentMethodButtonRouting? { get set }
    var listener: AddPaymentMethodButtonListener? { get set }
}

protocol AddPaymentMethodButtonViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AddPaymentMethodButtonRouter: ViewableRouter<AddPaymentMethodButtonInteractable, AddPaymentMethodButtonViewControllable>, AddPaymentMethodButtonRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: AddPaymentMethodButtonInteractable, viewController: AddPaymentMethodButtonViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
