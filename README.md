# Comparator

Easily match on the ordering of two `Comparable` values.
```swift
switch Ordering(a, b) {
  case .Ascending:  print("It's going up!")
  case .Same:       print("They're no different.")
  case .Descending: print("Down they go!")
}
```
You can also use the convenient operator `a <=> b` to create an `Ordering` value.
