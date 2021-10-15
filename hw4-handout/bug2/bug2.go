package bug2

import (
	"sync"
)

func bug2(n int, foo func(int) int, out chan int) {
	var wg sync.WaitGroup
	var a chan int = make(chan int, n)
	for i := 0; i < n; i++ {
		a <- i
		wg.Add(1)
		go func() {
			counter := <- a
			out <- foo(counter)
			wg.Done()
		}()
	}
	wg.Wait()
	close(out)
}
