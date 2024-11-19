package test

import "core:fmt"
import "core:math"
import "core:time"

Vector2 :: struct {
	x: f64,
	y: f64,
}

distance :: proc(v1: Vector2, v2: Vector2) -> f64 {
	first: f64 = math.pow_f64(v2.x - v1.x, 2)
	second: f64 = math.pow_f64(v2.y - v1.y, 2)
	return first + second
}

main :: proc() {

	start: time.Time = time.now()
	dist: f64

	for i: f64 = 0; i < 10_000_000; i += 1 {
		v1 := Vector2{i, i * 2}
		v2 := Vector2{i * 2, i * 2 + 2}
		dist = distance(v1, v2)
	}

	elapsed: time.Duration = time.since(start)
	fmt.printf("Odin took: %v, distance: %v", elapsed, dist)
	// {odin run .}
	// Odin took: 539.5388ms, distance: 9.9999980000005e+13

	// {odin run . -o:speed}
	// Odin took: 85.2┬╡s, distance: 9.9999980000005e+13
}
