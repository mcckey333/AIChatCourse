//
//  File.swift
//  AIChatCourse
//
//  Created by Intuin  on 26/5/2025.
//
import Foundation
import SwiftUI 

extension Binding where Value == Bool {
    init<T: Sendable>(ifNotNil value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}
