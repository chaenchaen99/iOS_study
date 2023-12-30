//
//  AddPaymentMethodButtonViewController.swift
//  MiniSuperApp
//
//  Created by 정채연 on 2022/09/12.
//

import ModernRIBs
import UIKit

protocol AddPaymentMethodButtonPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class AddPaymentMethodButtonViewController: UIViewController, AddPaymentMethodButtonPresentable, AddPaymentMethodButtonViewControllable {

    weak var listener: AddPaymentMethodButtonPresentableListener?
}
