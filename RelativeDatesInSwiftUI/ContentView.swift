//
//  ContentView.swift
//  RelativeDatesInSwiftUI
//
//  Created by ramil on 05.02.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Now: \(Date())")
            Text("Yesterday: \(1.days.ago!)")
            Text("3 years from now: \(3.years.fromNow!)")
            Text("1 hour and twenty minutes from now: \((1.hours + 20.minutes).fromNow!)")
            Text("1 hour - 55 seconds ago: \((1.hours - 55.seconds).ago!))")
            Text("2 weeks - 1 day + 5 hours ago: \((2.weeks - 1.days + 5.hours).ago!))")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
