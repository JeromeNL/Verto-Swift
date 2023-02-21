//
//  ModeHelper.swift
//  VertoAppSwiftUI
//
//  Created by Joram Kwetters on 15/02/2023.
//

import Foundation
import SwiftUI

class ModeHelper {
    let defaults = UserDefaults.standard
    
        var userInterfaceStyle: ColorScheme? = .dark
        
    func overrideDisplayMode(colorScheme: ColorScheme) {
            var selectedApperance = defaults.string(forKey: DefaultsKeys.lightMode)
            var userInterfaceStyle: UIUserInterfaceStyle

            if selectedApperance == "dark" {
                userInterfaceStyle = .dark
            } else if selectedApperance == "light" {
                userInterfaceStyle = .light
            } else {
                userInterfaceStyle = colorScheme == .light ? .light : .dark
            }
        
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = userInterfaceStyle
        }

}


