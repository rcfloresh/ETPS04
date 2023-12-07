//
//  Application.swift
//  projectETPS04
//
//  Created by Roberto Flores on 6/12/23.
//

import SwiftUI
import UIKit

final class Application_utility{
    static var rootViewController: UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else{
            return .init()
        }
        
        return root
    }
}
