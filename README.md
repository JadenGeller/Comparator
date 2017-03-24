# Comparator

Easily match on the ordering of two `Comparable` values.
```swift
switch Ordering(a, b) {
  case .ascending:  print("It's going up!")
  case .same:       print("They're no different.")
  case .descending: print("Down they go!")
}
```
You can also use the convenient operator `a <=> b` to create an `Ordering` value.
