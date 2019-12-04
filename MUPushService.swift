//
//  PushService.swift
//
//  Created by Edgar Semko on 10/14/19.
//  Copyright © 2019 MobileUp. All rights reserved.
//

import UIKit

#if canImport(MUFirebaseMessagingService)

import MUFirebaseMessagingService

#endif

public protocol MUPushService : class  {
    
    // MARK: - Public Methods
    
    func action(from userInfo:[AnyHashable:Any])
    
    func postAPNsNotification()
    
    func postFCMNotification()
    
}

extension MUPushService {
    
    public func postAPNsNotification() {
        
        NotificationCenter.default.post(name: .didReceivedFromAPNs, object: nil)
    }
    
    public func postFCMNotification() {
        
        #if canImport(MUFirebaseMessagingService)

        NotificationCenter.default.post(name: .didReceivedFromFCM, object: nil)
        
        #endif
    }
    
}