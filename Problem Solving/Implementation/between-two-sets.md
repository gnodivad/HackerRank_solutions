# Between Two Sets

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

/*
 * Complete the 'getTotalX' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER_ARRAY a
 *  2. INTEGER_ARRAY b
 */

func getTotalX(a []int32, b []int32) int32 {
    // Write your code here
    firstNumber := a[len(a) - 1]
    secondNumber := b[0]
    var count int32

    for i := firstNumber; i <= secondNumber; i++ {
        sumA := 0
        for _, v := range(a) {
            fmt.Println(i % v)

            if (i % v == 0) {
                sumA++
            } 
        }
        if (sumA != len(a)) {
            continue
        }

        sumB := 0
        for _, v := range(b) {
            if (v % i == 0) {
                sumB++
            } 
        }
        if (sumB != len(b)) {
            continue
        }

        count++
    }

    return count
}

func main() {
    reader := bufio.NewReaderSize(os.Stdin, 16 * 1024 * 1024)

    stdout, err := os.Create(os.Getenv("OUTPUT_PATH"))
    checkError(err)

    defer stdout.Close()

    writer := bufio.NewWriterSize(stdout, 16 * 1024 * 1024)

    firstMultipleInput := strings.Split(strings.TrimSpace(readLine(reader)), " ")

    nTemp, err := strconv.ParseInt(firstMultipleInput[0], 10, 64)
    checkError(err)
    n := int32(nTemp)

    mTemp, err := strconv.ParseInt(firstMultipleInput[1], 10, 64)
    checkError(err)
    m := int32(mTemp)

    arrTemp := strings.Split(strings.TrimSpace(readLine(reader)), " ")

    var arr []int32

    for i := 0; i < int(n); i++ {
        arrItemTemp, err := strconv.ParseInt(arrTemp[i], 10, 64)
        checkError(err)
        arrItem := int32(arrItemTemp)
        arr = append(arr, arrItem)
    }

    brrTemp := strings.Split(strings.TrimSpace(readLine(reader)), " ")

    var brr []int32

    for i := 0; i < int(m); i++ {
        brrItemTemp, err := strconv.ParseInt(brrTemp[i], 10, 64)
        checkError(err)
        brrItem := int32(brrItemTemp)
        brr = append(brr, brrItem)
    }

    total := getTotalX(arr, brr)

    fmt.Fprintf(writer, "%d\n", total)

    writer.Flush()
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