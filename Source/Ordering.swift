//
//  Ordering.swift
//  Comparator
//
//  Created by Jaden Geller.
//

/// Describes the relative ordering of a pair of values.
public enum Ordering {
    /// The second value is greater than the first value.
    case ascending
    /// The second value is equal to the first value.
    case same
    /// The second value is less than the first value.
    case descending
}

extension Ordering {
    /// Creates an instance from two comparable values.
    public init<C: Comparable>(from lhs: C, to rhs: C) {
        if      lhs < rhs { self = .ascending }
        else if lhs > rhs { self = .descending }
        else              { self = .same }
    }
    
    /// Creates an instance from two values and an ordering function
    /// which imposes a strict total order.
    public init<C>(_ lhs: C, _ rhs: C, by areIncreasingInOrdering: (C, C) -> Bool) {
        switch (areIncreasingInOrdering(lhs, rhs), areIncreasingInOrdering(rhs, lhs)) {
        case (false, false): self = .same
        case (true, false):  self = .ascending
        case (false, true):  self = .descending
        case (true, true): fatalError("`isOrderedBefore` must use a strict weak ordering.")
        }
    }
}

extension Ordering {
    /// Returns an instance where the direction is reversed.
    public var reversed: Ordering {
        switch self {
        case .ascending:  return .descending
        case .descending: return .ascending
        case .same:       return .same
        }
    }
}

infix operator <=> : ComparisonPrecedence

/// Constructs an ordering instance from two comparable values.
public func <=><C: Comparable>(lhs: C, rhs: C) -> Ordering {
    return Ordering(from: lhs, to: rhs)
}
