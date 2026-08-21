public import RFC_4122
public import Random

extension RFC_4122.UUID {

    public static func v4() throws(Random.Error) -> Self {
        try unsafe v4(fillRandom: Random.fill)
    }
}
