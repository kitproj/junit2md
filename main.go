package main

import (
	_ "embed"
	"encoding/xml"
	"fmt"
	"os"
	"strconv"
	"strings"
	"time"

	"github.com/jstemmer/go-junit-report/formatter"
)

func printTest(c formatter.JUnitTestCase) {
	text := "✅"
	f := c.Failure
	if f != nil {
		text = "❌"
	}
	k := c.SkipMessage
	if k != nil {
		text = "⏩️"
	}
	fmt.Printf("### %s %s\n", c.Name, text)

	if f != nil {
		fmt.Printf("```\n%s\n```\n", f.Contents)
	} else if k != nil {
		fmt.Printf("%s\n", k.Message)
	}
	d, _ := time.ParseDuration(c.Time)
	fmt.Printf("%v\n", d)
}

func main() {
	suites := &formatter.JUnitTestSuites{}

	err := xml.NewDecoder(os.Stdin).Decode(suites)
	if err != nil {
		panic(err)
	}

	failures, total := 0, 0
	for _, s := range suites.Suites {
		failures += s.Failures
		total += len(s.TestCases)
	}
	fmt.Printf("%d of %d tests failed\n", failures, total)
	for _, s := range suites.Suites {
		if s.Failures > 0 {
			printSuiteHeader(s)
			for _, c := range s.TestCases {
				if f := c.Failure; f != nil {
					printTest(c)
				}
			}
		}
	}
	for _, s := range suites.Suites {
		printSuiteHeader(s)
		for _, c := range s.TestCases {
			if c.Failure == nil {
				printTest(c)
			}
		}
	}
}

func printSuiteHeader(s formatter.JUnitTestSuite) {
	fmt.Printf("## %s", s.Name)
	for _, p := range s.Properties {
		if strings.HasPrefix(p.Name, "coverage.") {
			v, _ := strconv.ParseFloat(p.Value, 10)
			fmt.Printf("(%.0f%%)", v)
		}
	}
	fmt.Println()
}
