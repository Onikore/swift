// Protocols and generics
protocol Describable {
    var description: String { get }
}

struct Book: Describable {
    let title: String
    var description: String { "Book: \(title)" }
}

struct Movie: Describable {
    let title: String
    var description: String { "Movie: \(title)" }
}

func printAll(_ items: [Describable]) {
    for item in items { print(item.description) }
}
printAll([Book(title: "Dune"), Movie(title: "Interstellar")])

// generics
func firstAndLast<T>(_ items: [T]) -> (T, T)? {
    guard let first = items.first, let last = items.last else { return nil }
    return (first, last)
}
if let (first, last) = firstAndLast([10, 20, 30]) {
    print("first: \(first), last: \(last)")
}

// generic type constrained to Equatable
func allEqual<T: Equatable>(_ items: [T]) -> Bool {
    guard let first = items.first else { return true }
    return items.allSatisfy { $0 == first }
}
print(allEqual([1, 1, 1]))
print(allEqual(["a", "b"]))
