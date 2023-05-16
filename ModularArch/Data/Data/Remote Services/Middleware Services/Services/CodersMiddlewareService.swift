//
//  CodersMiddlewareService.swift
//  CodersList
//
//  Created by Mohamed Salem on 21/03/2022.
//

import Foundation
import Combine

public protocol CodersMiddlewareProtocol {
    func getCodersList() -> AnyPublisher<[CoderItem],MiddlewareError>
}
public class CodersMiddlewareService: MiddlewareService<CodersEndPoints>, CodersMiddlewareProtocol {
    public override init() {
        
    }
    public func getCodersList() -> AnyPublisher<[CoderItem],MiddlewareError> {
        return request(target: .getCodersList)
    }
}
