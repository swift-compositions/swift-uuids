# swift-uuids

Use this package when you need to generate new UUIDs with the system's secure random number generator. Call `RFC_4122.UUID.v4()` for a random identifier, or `RFC_9562.UUID.v7(unixMilliseconds:)` for one that sorts by creation time. If you only parse, compare or format UUIDs, or bring your own randomness, use swift-rfc-4122 or swift-rfc-9562 directly.

## Laws

- Random bits come only from the system generator. If it fails, generation throws. There is no weaker fallback.
- `RFC_9562.UUID.v7(unixMilliseconds:)` writes the timestamp big-endian into the first six bytes, so UUIDs from a later millisecond sort after those from an earlier one. The remaining bits are random, so two UUIDs made in the same millisecond have no defined order.
