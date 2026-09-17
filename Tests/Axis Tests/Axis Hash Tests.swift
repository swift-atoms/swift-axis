import Axis
import Testing

@Suite
struct `Axis hash protocols preserve distinct axis identities` {
    @Test
    func `Axis conforms to Hashable`() {
        func acceptsHash<T: Swift.Hashable>(_ value: T) -> T { value }

        #expect(acceptsHash(Axis<3>.secondary) == .secondary)
    }

    @Test
    func `Hashable produces unique set elements`() {
        let set: Set<Axis<3>> = [.primary, .secondary, .tertiary, .primary]
        #expect(set.count == 3)
    }
}
