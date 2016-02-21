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
}

extension Ordering {
    public init<C: Comparable>(_ lhs: C, _ rhs: C) {
        if      lhs < rhs { self = .Ascending }
        else if lhs > rhs { self = .Descending }
        else              { self = .Same }
    }
    
    public init<C: Equatable>(_ lhs: C, _ rhs: C, @noescape isOrderedBefore: (C, C) -> Bool) {
        if lhs == rhs { self = .Same }
        else { self = isOrderedBefore(lhs, rhs) ? .Ascending : .Descending }
    }
    
    // Assumes stict-weak ordering
    public init<C>(_ lhs: C, _ rhs: C, @noescape isOrderedBefore: (C, C) -> Bool) {
        switch (isOrderedBefore(lhs, rhs), isOrderedBefore(rhs, lhs)) {
        case (false, false): self = .Same
        case (true, false):  self = .Ascending
        case (false, true):  self = .Descending
        case (true, true): fatalError("`isOrderedBefore` must use a strict weak ordering.")
        }
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
