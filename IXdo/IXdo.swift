//
//  IXdo.swift
//  IXdo
//
//  Created by Daeho Kim on 15.07.21.
//

import Foundation
import SwiftUI

protocol IXdo: CustomStringConvertible {
    func getValue(elementName: String) -> Any?
    mutating func setValue(elementName: String, value: Any?)
}

protocol IObjectXdo: IXdo {
    var TicId: String? { get set }
    var ObjectVersionBeginTime: Date? { get set }
    var ObjectVersionEndTime: Date? { get set }
    var ObjectVersionStatus: Int? { get set }
    var StoreTime: Date?  { get set }
    var CreateTime: Date?  { get set }
    var CreatedByUser: String? { get set }
    var CreatedByTeam: String? { get set }
    var CreatedByComponent: String? { get set }
    var CreatedByProcess: String? { get set }
    var CreatedBySystem: String? { get set }
    
    
}

extension IXdo {
    func print(_ xdo: IXdo) {
        
    }
}

extension IXdo {
    // TODO: Daeho
    var description: String {
        return ""
    }
}
