//
//  ContentView.swift
//  IXdo
//
//  Created by Daeho Kim on 15.07.21.
//

import SwiftUI

struct ContentView: View {
    var test: Test = Test()
    
    var body: some View {
        test.test()
        return    Text("Hello")
                .padding()
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
