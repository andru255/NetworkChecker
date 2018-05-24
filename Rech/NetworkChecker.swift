//
//  NetworkChecker.swift
//  Rech
//
//  Created by Erik Flores on 5/24/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import Foundation
import Reachability

protocol NetworkCheckerDelegate {
    func network(_ status: Reachability.Connection)
}

class NetworkChecker {

    var delegate: NetworkCheckerDelegate?
    public static let shared = NetworkChecker()

    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(NetworkChecker.shared.showNotNetworkIdentifier), name: NSNotification.Name("NetworkStatus"), object: nil)
    }

    @objc
    func showNotNetworkIdentifier(_ notification: Notification) {
        let status = notification.object as! Reachability.Connection
        delegate?.network(status)
    }

}
