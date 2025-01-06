//
//  RequestParameters.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 1/7/25.
//

import Foundation

public enum RequestParameters {
    case none
    case query(_ parameters: Encodable?)
    case body(_ parameters: Encodable?)
}

