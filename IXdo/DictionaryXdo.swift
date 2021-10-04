//
//  DictionaryXdo.swift
//  IXdo
//
//  Created by Daeho Kim on 15.07.21.
//

import Foundation
import SwiftUI


// class
class ComplexXdo: IXdo {
    func setValue(elementName: String, value: Any?) {
        content[elementName] = value
    }

    func getValue(elementName: String) -> Any? {
        return content[elementName]
    }

    var content: [String: Any] = [:]
}

// struct
struct ComplexXdoStruct: IXdo {
    func getValue(elementName: String) -> Any? {
        return content[elementName]
    }
    
    mutating func setValue(elementName: String, value: Any?) {
        content[elementName] = value
    }
    
    private var content: [String: Any] = [:]
}



class ObjectXdo: ComplexXdo, IObjectXdo {
    override func getValue(elementName: String) -> Any? {
        switch elementName {
            case "TicId":
                return self.TicId
            case "ObjectVersionBeginTime":
                return self.ObjectVersionBeginTime as Any
            case "ObjectVersionEndTime":
                return self.ObjectVersionEndTime as Any
            case "ObjectVersionStatus":
                return self.ObjectVersionStatus as Any
            default:
                return super.getValue(elementName: elementName)
        }
    }
    
    override func setValue(elementName: String, value: Any?) {
        switch elementName {
            case "TicId":
                TicId = value as? String
                break
            case "ObjectVersionBeginTime":
                ObjectVersionBeginTime = value as? Date
                break
            case "ObjectVersionEndTime":
                ObjectVersionEndTime = value as? Date
                break
            case "ObjectVersionStatus":
                ObjectVersionStatus = value as? Int
                break
            default:
                super.setValue(elementName: elementName, value: value)
                break
        }
    }
    
    var TicId: String?
    var ObjectVersionBeginTime: Date?
    var ObjectVersionEndTime: Date?
    var ObjectVersionStatus: Int?
    var StoreTime: Date?
    var CreateTime: Date?
    var CreatedByUser: String?
    var CreatedByTeam: String?
    var CreatedByComponent: String?
    var CreatedByProcess: String?
    var CreatedBySystem: String?
    
    // aufhabe
    // getValue implement
    // indexer verbindung
    // ixdo print -> extension
}

class Test {
    func test() {
        var users = [ObjectXdo]()
        
        // user
        let user = ObjectXdo()
        
        var names = [ComplexXdo]()
        let name1 = ComplexXdo()
        name1.setValue(elementName: "Culture", value: 1031)
        name1.setValue(elementName: "Text", value: "Rainer Klockmann")
        
        let name2 = ComplexXdo()
        name2.setValue(elementName: "Culture", value: 1033)
        name2.setValue(elementName: "Text", value: "Rainer Klockmann")
        
        let name3 = ComplexXdo()
        name3.setValue(elementName: "Culture", value: 3079)
        name3.setValue(elementName: "Text", value: "Rainer Klockmann")
        
        names.append(name1)
        names.append(name2)
        names.append(name3)
        
        var initials = [ComplexXdo]()

        let initial1 = ComplexXdo()
        initial1.setValue(elementName: "Culture", value: 1031)
        initial1.setValue(elementName: "Text", value: "RK")

        let initial2 = ComplexXdo()
        initial2.setValue(elementName: "Culture", value: 1033)
        initial2.setValue(elementName: "Text", value: "RK")

        let initial3 = ComplexXdo()
        initial3.setValue(elementName: "Culture", value: 3079)
        initial3.setValue(elementName: "Text", value: "RK")

        initials.append(initial1)
        initials.append(initial2)
        initials.append(initial3)
        
//        user.TicId = "TIC/5"
//        user["TicId"] = "TIC/5"
//        let a = user["TicId"] // getter
//        let _ = user.getValue(elementName: "TIC/5")
        user.setValue(elementName: "TicId", value: "TIC/5")
        user.setValue(elementName: "Name", value: names)
        user.setValue(elementName: "Username", value: "rainer.klockmann")
        user.setValue(elementName: "Pssword", value: "bjISvAsIXuMwQegoMXObUA==")
        user.setValue(elementName: "Telephone", value: "+49.3471.6374929")
        user.setValue(elementName: "Email", value: "rainer.klockmann@gewi.com")
        user.setValue(elementName: "UserInterface", value: "TIC-RK/1")
        user.setValue(elementName: "Culture", value: 1031)
        user.setValue(elementName: "AutomaticLogIn", value: true)
        user.setValue(elementName: "Disabled", value: false)
        user.setValue(elementName: "Initials", value: initials)
        
        user.ObjectVersionBeginTime = Date()
        user.ObjectVersionStatus = 2
        user.StoreTime = Date()
        user.CreateTime = Date()
        user.CreatedByUser = "TIC/5"
        user.CreatedByTeam = "TIC-RK/1"
        user.CreatedBySystem = "RKI"
        
        users.append(user)
        
        // user2
        let user2 = ObjectXdo()
        
        var names2 = [ComplexXdo]()
        let name21 = ComplexXdo()
        name21.setValue(elementName: "Culture", value: 1031)
        name21.setValue(elementName: "Text", value: "Robert Pejas")
        names2.append(name21)
        
        var initials2 = [ComplexXdo]()
        let initial21 = ComplexXdo()
        initial21.setValue(elementName: "Culture", value: 1031)
        initial21.setValue(elementName: "Text", value: "RP")
        initials2.append(initial21)
        
        user2.TicId = "TIC/33"
        user2.setValue(elementName: "Name", value: names2)
        user2.setValue(elementName: "Username", value: "robert.pejas")
        user2.setValue(elementName: "Pssword", value: "SKRwAqLurtzI2Rnz0J0B3w==")
        user2.setValue(elementName: "Email", value: "robert.pejas@gewi.com")
        user2.setValue(elementName: "Culture", value: 1033)
        user2.setValue(elementName: "AutomaticLogIn", value: true)
        user2.setValue(elementName: "Disabled", value: false)
        user2.setValue(elementName: "Initials", value: initials2)
        
        user2.ObjectVersionBeginTime = Date()
        user2.ObjectVersionStatus = 1
        user2.StoreTime = Date()
        user2.CreateTime = Date()
        user2.CreatedByUser = "TIC/21"
        user2.CreatedBySystem = "TIC"
        
        users.append(user2)
        
        // user3
        let user3 = ObjectXdo()
        
        var names3 = [ComplexXdo]()
        let name31 = ComplexXdo()
        name31.setValue(elementName: "Culture", value: 1031)
        name31.setValue(elementName: "Text", value: "Ronny Dittrich")
        names3.append(name31)
        
        var initials3 = [ComplexXdo]()
        let initial31 = ComplexXdo()
        initial31.setValue(elementName: "Culture", value: 1033)
        initial31.setValue(elementName: "Text", value: "RD")
        initials3.append(initial31)
        
        user3.TicId = "TIC/31"
        user3.setValue(elementName: "Name", value: names)
        user3.setValue(elementName: "Username", value: "ronny.dittrich")
        user3.setValue(elementName: "Pssword", value: "mL7rjuWG/wghNSDt0qcfNw==")
        user3.setValue(elementName: "Telephone", value: "+49.341.33976466")
        user3.setValue(elementName: "Email", value: "ronny.dittrich@gewi.com")
        user3.setValue(elementName: "Culture", value: 1033)
        user3.setValue(elementName: "AutomaticLogIn", value: true)
        user3.setValue(elementName: "Disabled", value: false)
        user3.setValue(elementName: "Initials", value: initials3)
        
        user3.ObjectVersionBeginTime = Date()
        user3.ObjectVersionStatus = 1
        user3.CreateTime = Date()
        user3.CreatedByUser = "TIC/21"
        user3.CreatedBySystem = "TIC"
        
        users.append(user3)
        
        
    }
}

