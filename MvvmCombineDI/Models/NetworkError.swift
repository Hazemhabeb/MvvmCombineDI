//
//  NetworkError.swift
//  MvvmCombineDI
//
//  Created by hazemhabeb on 12/08/2025.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case noInternet
    case serverError
    case invalidData
    
    var errorDescription: String? {
        switch self {
        case .noInternet: return "No internet connection"
        case .serverError: return "Server error occurred"
        case .invalidData: return "Invalid data received"
        }
    }
}
