import Axis
import Foundation
import Testing

@Suite struct `Axis validation preserves the dimension` {
    @Test(arguments: [Int.min, -1, 0, 1, Int.max])
    func `Zero dimensions have no valid axis`(index: Int) {
        #expect(throws: Axis<0>.Error.outOfBounds(index)) {
            try Axis<0>(index)
        }
        #expect(Axis<0>.count == 0)
        #expect(Array(Axis<0>.allCases).isEmpty)
    }

    @Test(arguments: [Int.min, -1, 3, Int.max])
    func `Decoding rejects an index outside the dimension`(index: Int) throws {
        let data = try JSONEncoder().encode(index)
        #expect(throws: DecodingError.self) {
            try JSONDecoder().decode(Axis<3>.self, from: data)
        }
    }

    @Test(arguments: [0, 1, 2])
    func `Decoding preserves a valid axis`(index: Int) throws {
        let axis = try Axis<3>(index)
        let data = try JSONEncoder().encode(axis)
        #expect(try JSONDecoder().decode(Axis<3>.self, from: data) == axis)
    }

    @Test func `Errors belong to the axis dimension`() {
        let two: any Swift.Error = Axis<2>.Error.outOfBounds(3)
        let three: any Swift.Error = Axis<3>.Error.outOfBounds(3)
        #expect(two is Axis<2>.Error)
        #expect(!(two is Axis<3>.Error))
        #expect(three is Axis<3>.Error)
        #expect(Set([Axis<2>.Error.outOfBounds(3), .outOfBounds(3)]).count == 1)
    }
}
