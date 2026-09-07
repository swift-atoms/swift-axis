#if !hasFeature(Embedded)
extension Axis: Swift.Codable {

        public init(from decoder: any Decoder) throws(any Swift.Error) {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(Int.self)
            do throws(Self.Error) {
                self = try Self(value)
            } catch {
                throw DecodingError.dataCorrupted(
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription:
                            "Axis index \(value) out of bounds for \(N)-dimensional space"
                    )
                )
            }
        }

        public func encode(to encoder: any Encoder) throws(any Swift.Error) {
            var container = encoder.singleValueContainer()
            try container.encode(underlying)
        }
    }
#endif
