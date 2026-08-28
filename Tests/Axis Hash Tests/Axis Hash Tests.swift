import Axis
import Axis_Hash
import Hash_Protocol
import Testing

@Suite
struct `Axis Hash Tests` {
    @Test
    func `Axis conforms to Hash Protocol`() {
        func acceptsHash<T: Hash::Hash.`Protocol`>(_ value: T) -> T { value }

        #expect(acceptsHash(Axis<3>.secondary) == .secondary)
    }

    @Test
    func `Hashable produces unique set elements`() {
        let set: Set<Axis<3>> = [.primary, .secondary, .tertiary, .primary]
        #expect(set.count == 3)
    }
}
