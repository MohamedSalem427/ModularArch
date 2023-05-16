//
//  Environment.swift
//  Shift
//
//  Created by ziad on 3/28/20.
//  Copyright © 2020 generation-c. All rights reserved.
//

import Foundation
//
public enum AppEnvironment: String {
    
    case production
    case sandbox
    case develop
    
    
    private static var environmentConfig:(_ key: InfoPListKeys.EnvironmentKeys) -> String = {
        let dic: NSDictionary? = InfoPList.shared.get(.environmentConfig) as? NSDictionary
        return dic?[$0.rawValue] as? String ?? ""
    }
    
    public static var baseURL: URL {
       return URL(string: environmentConfig(.apiBaseURL))!
    }
    static var type: AppEnvironment? {
        let configuration = environmentConfig(.configuration).lowercased()
        return AppEnvironment(rawValue: configuration)
    }
    
   static var typeName: String? {
        return environmentConfig(.configuration)
    }
    
}
