// Optionals and error handling
enum ValidationError: Error {
    case tooShort
    case empty
}

func validate(_ text: String) throws -> String {
    if text.isEmpty { throw ValidationError.empty }
    if text.count < 3 { throw ValidationError.tooShort }
    return text
}

for input in ["", "ab", "hello"] {
    do {
        let result = try validate(input)
        print("valid: \(result)")
    } catch ValidationError.empty {
        print("error: empty input")
    } catch ValidationError.tooShort {
        print("error: too short")
    } catch {
        print("unknown error: \(error)")
    }
}

// optional binding and chaining
let maybeNumbers: [String: Int] = ["one": 1]
if let one = maybeNumbers["one"] {
    print("found: \(one)")
}
let missing = maybeNumbers["two"] ?? -1
print("missing defaults to: \(missing)")

struct Address { let city: String? }
struct Person { let address: Address? }
let person = Person(address: Address(city: nil))
print("city: \(person.address?.city ?? "unknown")")
