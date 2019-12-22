//
//  PrivacyPolicyDelegate.swift
//  
//
//  Created by Jaesung on 2019/12/23.
//

import Foundation

public protocol PrivacyPolicyDelegate: class {
    func collectsUserInformation() -> Bool
    
    func tracksAndCollectsCookieData() -> Bool
    
    func isDataSafe() -> Bool
    
    func linksToOtherSites() -> Bool
    
    func servicesToChildren() -> Bool
}
