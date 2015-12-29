//
//  Ordering.swift
//  Ordering
//
//  Created by Jaden Geller on 10/29/15.
//  Copyright © 2015 Jaden Geller. All rights reserved.
//

public enum Ordering {
    case Ascending
    case Same
    case Descending
    
    init<C: Comparable>(_ lhs: C, _ rhs: C) {
        if      lhs < rhs { self = .Ascending }
        else if lhs > rhs { self = .Descending }
        else              { self = .Same }
    }
}

extension Ordering {
    public var reversed: Ordering {
        switch self {
        case .Ascending:  return .Descending
        case .Descending: return .Ascending
        case .Same:       return .Same
        }
    }
}

infix operator <=> {
    associativity none
    precedence 130
}

public func <=><C: Comparable>(lhs: C, rhs: C) -> Ordering {
    return Ordering(lhs, rhs)
}
