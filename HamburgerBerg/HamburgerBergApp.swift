//
//  HamburgerBergApp.swift
//  HamburgerBerg
//
//  Created by Hoang Duc Nguyen on 01.09.21.
//

import SwiftUI

@main
struct HamburgerBergApp: App {
    var body: some Scene {
        WindowGroup {
          ListBeerView(viewModel: ListViewModel())
        }
    }
}
