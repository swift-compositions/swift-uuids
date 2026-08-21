public import RFC_9562
public import Random

extension RFC_9562.UUID {

    public static func v7(unixMilliseconds: Int64) throws(Random.Error) -> Self {
        try unsafe v7(unixMilliseconds: unixMilliseconds, fillRandom: Random.fill)
    }
}
