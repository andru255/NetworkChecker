//
//  RechabilityManager.swift
//  Rech
//
//  Created by Erik Flores on 5/24/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import Reachability
import Foundation
import NotificationCenter

class RechabilityManager {

    static let shared = RechabilityManager()
    private let reachability = Reachability()!

    func start() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged), name: .reachabilityChanged, object: reachability)
        do {
            try reachability.startNotifier()
        } catch {
            print("No se puede monitorear la conectividad")
        }
    }

    func stop() {
        reachability.stopNotifier()
    }

    @objc private func reachabilityChanged(_ notification: Notification) {
        guard let reachability = notification.object as? Reachability else {
            return
        }
        NotificationCenter.default.post(name: NSNotification.Name("NetworkStatus"), object: reachability.connection)
    }
    
}
