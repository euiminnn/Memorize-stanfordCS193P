func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("(A) I hope the weather is nice near you.")
        return
    }
    
    print("(B) I hope the weather is nice in \(location).")
}

print("Ex.1")
greet(person: ["name": "John"])
print("\n")
print("Ex.2")
greet(person: ["name": "Jane", "location": "Cupertino"])


