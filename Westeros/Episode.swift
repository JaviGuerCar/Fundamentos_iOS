//
//  Episode.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 18/8/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import Foundation

final class Episode {
    
    let title: String
    let issueDate: Date
    weak var season: Season?
    
    
    init(title: String, issueDate: Date, season: Season){
        (self.title, self.issueDate, self.season) = (title, issueDate, season)
    }
    
}

// Implementamos los protocolos
// Primero creamos el proxy
extension Episode {
    var proxy:String{
        get {
            return "\(title) \(issueDate) \(season!.name)"
        }
    }
}

// MARK: - Equatable
extension Episode: Equatable{
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

// MARK: - Comparable
extension Episode: Comparable{
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}

// MARK: - Hashable
extension Episode : Hashable {
    var hashValue: Int {
        get {
            return proxy.hashValue
        }
    }
}

// MARK: - CustomStringConvertible
extension Episode: CustomStringConvertible{
    var description: String {
        get {
            return "<\(type(of: self)): \(title)>"
        }
    }
}
