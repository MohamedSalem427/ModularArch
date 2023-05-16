//
//  CodersEndPoints.swift
//  CodersList
//
//  Created by Mohamed Salem on 21/03/2022.
//

import Foundation
import Moya
import Core

public enum CodersEndPoints {
    case getCodersList
}
//MARK: - TargetType & AccessTokenAuthorizable
extension CodersEndPoints: TargetType, AccessTokenAuthorizable {
    public var baseURL: URL { AppEnvironment.baseURL }
    public var path: String {
        switch self {
        case .getCodersList: return "repositories"
        }
    }
    public var method: Moya.Method {
        switch self {
        case .getCodersList: return .get
        }
    }
    
    public var parameters: [String:Any] {
        switch self {
        case .getCodersList:
            return [:]
        }
    }
    public var task: Task {
        return .requestPlain
    }
    public var headers: [String : String]? {[:]}
    public var authorizationType: AuthorizationType? { .basic }
}

