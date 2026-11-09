import Testing

@testable import UUIDs

extension UUIDs.Test.`Edge Case` {
    @Test
    func `v7(at:) accepts the epoch`() throws {
        let uuid = try RFC_9562.UUID.v7(at: RFC_9562.Timestamp(unixMilliseconds: 0))
        #expect(uuid.bytes.0 == 0)
        #expect(uuid.bytes.5 == 0)
        #expect(uuid.bytes.6 >> 4 == 7)
    }
}
