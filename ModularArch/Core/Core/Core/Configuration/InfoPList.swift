//
//  InfoPList.swift
//  Shift
//
//  Created by ziad on 4/8/20.
//  Copyright © 2020 generation-c. All rights reserved.
import Foundation
public protocol InfoPListProtocol {
     func get(_ key: InfoPListKeys) -> Any?
}

public class InfoPList: InfoPListProtocol {
    class var shared: InfoPList {
        return InfoPList()
    }
    public func get(_ key: InfoPListKeys) -> Any?  {
        return NetworkLayerBundle.bundle.infoDictionary?[key.rawValue]
    }
}


class NetworkLayerBundle {
    static var bundle = Bundle(for: NetworkLayerBundle.self)
}
