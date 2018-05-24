//
//  MainTabBarViewController.swift
//  Rech
//
//  Created by Erik Flores on 5/24/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import UIKit
import Reachability

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkChecker.shared.delegate = self
    }

}

extension MainTabBarViewController: NetworkCheckerDelegate {
    func network(_ status: Reachability.Connection) {
        print("💥 \(status)")
        switch status {
        case .none:
            changeColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        case .cellular, .wifi:
            changeColor(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))
        }
    }

    func changeColor(_ color: UIColor) {
        for controller in self.viewControllers! {
            guard let navigation = controller as? UINavigationController else {
                return
            }
            let viewController = navigation.viewControllers[0]
            viewController.view.backgroundColor = color
        }
    }
}
