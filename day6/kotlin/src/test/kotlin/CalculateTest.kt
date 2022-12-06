import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

internal class CalculateTest {

    private val calculate: Calculate = Calculate()

    private val testCasesPart1 = arrayOf(
        arrayOf("bvwbjplbgvbhsrlpgdmjqwftvncz", 7),
        arrayOf("nppdvjthqldpwncqszvftbrmjlhg", 6),
        arrayOf("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", 11),
        arrayOf("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", 11)
    )

    @Test
    fun calculate() {
        for (result in testCasesPart1.iterator())
            assertEquals(result[1], calculate.calculate(result[0].toString()))
    }
}