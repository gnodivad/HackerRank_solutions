# Mini-Max Sum

## golang

```go
package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
    "strconv"
    "strings"
)

// Complete the miniMaxSum function below.
func miniMaxSum(arr []int64) {
    var sum int64
    minValue := arr[0]
    maxValue := arr[0]
    for _, value := range arr {
        sum += value
        minValue = min(minValue, value)
        maxValue = max(maxValue, value)
    }

    fmt.Print(sum - maxValue, sum - minValue)
}

func min(x, y int64) int64 {
    if x < y {
        return x
    }
    return y
}

func max(x, y int64) int64 {
    if x > y {
        return x
    }
    return y
}

func main() {
    reader := bufio.NewReaderSize(os.Stdin, 1024 * 1024)

    arrTemp := strings.Split(readLine(reader), " ")

    var arr []int64

    for i := 0; i < 5; i++ {
        arrItemTemp, err := strconv.ParseInt(arrTemp[i], 10, 64)
        checkError(err)
        arrItem := int64(arrItemTemp)
        arr = append(arr, arrItem)
    }

    miniMaxSum(arr)
}

func readLine(reader *bufio.Reader) string {
    str, _, err := reader.ReadLine()
    if err == io.EOF {
        return ""
    }

    return strings.TrimRight(string(str), "\r\n")
}

func checkError(err error) {
    if err != nil {
        panic(err)
    }
}
```