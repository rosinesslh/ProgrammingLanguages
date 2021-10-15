package smash

import (
	"io"
	"sync"
	"strings"
	"bytes"
	
)

type word string

func checkLock(curr uint32, wg *sync.WaitGroup, mux *sync.Mutex, m map[uint32]uint) {
	mux.Lock()
	m[curr]++
	mux.Unlock()
	wg.Done()
}

func Smash(r io.Reader, smasher func(word) uint32) map[uint32]uint {
	m := make(map[uint32]uint)

	var wg sync.WaitGroup
	var mux sync.Mutex

	buff := new(bytes.Buffer)
	
	buff.ReadFrom(r)
	
	In := buff.String() 
	
	v := strings.Fields(In)

		for i := 0; i < len(v); i++{
		curr := smasher(word(v[i]))
		wg.Add(1)
		go checkLock(curr, &wg, &mux, m)
		wg.Wait()	
		}


	return m
}


