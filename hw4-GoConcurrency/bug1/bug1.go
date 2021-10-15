package bug1

import (
	"sync"
)

// Counter stores a count.
type Counter struct {
	n int64
	lc sync.Mutex
}

// Inc increments the count in the Counter.
func (c *Counter) Inc() {
	c.lc.Lock()
	c.n++
	c.lc.Unlock()
}

