//
//  LazyContentView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 7/6/23.
//

import Foundation
import SwiftUI

///  A view passed into this struct will be computed lazily.
/// This allows views in navigation links to be initialized on appearance, not when the parent view is inititially loaded.
struct LazyContentView<Content: View>: View {
    let content: () -> Content
    init( _ contentClosure: @escaping () -> Content) {
        self.content = contentClosure
    }
    
    var body: some View {
        content()
    }
}
