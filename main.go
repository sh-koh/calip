package main

import (
	"fmt"
	"strconv"
	"strings"
)

var colors = map[string]string{
	"black":     "\033[0;30m",
	"red":       "\033[0;31m",
	"green":     "\033[0;32m",
	"brown":     "\033[0;33m",
	"blue":      "\033[0;34m",
	"purple":    "\033[0;35m",
	"cyan":      "\033[0;36m",
	"yellow":    "\033[0;33m",
	"bold":      "\033[0m",
	"faint":     "\033[2m",
	"italic":    "\033[3m",
	"underline": "\033[4m",
	"blink":     "\033[5m",
	"negative":  "\033[7m",
	"crossed":   "\033[9m",
	"nc":        "\033[0m",
}

func parseAddr(ip string) (r []string) {
	r = make([]string, 4)
	for i, v := range strings.Split(ip, ".") {
		r[i] = v
	}
	return
}

func toBin(ip []string) (r []string) {
	r = make([]string, 4)
	for i, v := range ip {
		converted, _ := strconv.Atoi(v)
		if converted > 255 {
			panic(fmt.Sprintf("%sMax value of a byte is 255.%s\n", colors["red"], colors["nc"]))
		}
		r[i] = fmt.Sprintf("%08b", converted)
	}
	return
}

func fmtAddr(ip []string) string {
	return fmt.Sprintf("%sYour IP is%s: %s.%s.%s.%s", colors["blue"], colors["nc"], ip[0], ip[1], ip[2], ip[3])
}

func main() {
	var input string
	fmt.Printf("%sEnter an IP address%s: ", colors["yellow"], colors["nc"])
	fmt.Scan(&input)

	conv := fmtAddr(toBin(parseAddr(input)))
	fmt.Println(conv)
}
