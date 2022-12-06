
class Calculate {

    fun calculate(stream: String, size: Int=4): Int {
        var marker = ""
        var length = 0
        for (ch in stream.iterator()) {
            if (marker.contains(ch)) marker = ""
            marker += ch
            length += 1
            if (marker.length == size) break
        }
        return length
    }
}