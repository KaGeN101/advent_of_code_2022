import java.io.File

fun main(args: Array<String>) {
    val calculate: Calculate = Calculate()

    val lines = File("src/main/resources/input.txt").readLines()
    val inputData = lines[0].strip()
    println("Part 1: " + calculate.calculate(inputData, 4))
    println("Part 2: " + (calculate.calculate(inputData, 14) - 1) )
    println("yay!!!!")

    // Try adding program arguments via Run/Debug configuration.
    // Learn more about running applications: https://www.jetbrains.com/help/idea/running-applications.html.
    println("Program arguments: ${args.joinToString()}")
}