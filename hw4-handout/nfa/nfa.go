package nfa

//import "fmt"
import "sync"

// A nondeterministic Finite Automaton (NFA) consists of states,
// symbols in an alphabet, and a transition function.

// A state in the NFA is represented as an unsigned integer.
type state uint

// Given the current state and a symbol, the transition function
// of an NFA returns the set of next states the NFA can transition to
// on reading the given symbol.
// This set of next states could be empty.
type TransitionFunction func(st state, sym rune) []state

// Reachable returns true if there exists a sequence of transitions
// from `transitions` such that if the NFA starts at the start state
// `start` it would reach the final state `final` after reading the
// entire sequence of symbols `input`; Reachable returns false otherwise.
func Reachable(
	// `transitions` tells us what our NFA looks like
	transitions TransitionFunction,
	// `start` and `final` tell us where to start, and where we want to end up
	start, final state,
	// `input` is a (possible empty) list of symbols to apply.
	input []rune,
) bool {
	var wg sync.WaitGroup

	val := make(chan bool)
	var mux sync.Mutex

	wg.Add(1)

	go checkState(transitions, start, final, input, &wg, &mux, val)
	go func() { 
		wg.Wait()
		close(val)
	}()

	for r := range val {
		if r == true {
			return true
		}
	}
	return false
}

func checkState(transitions TransitionFunction, start, final state, input []rune, wg *sync.WaitGroup, mux *sync.Mutex, val chan bool) {

	//defer wg.Done()
	if len(input) == 0 {
		mux.Lock()
		if start == final {
			val <- true
		}
		mux.Unlock()
	} else {
		nextS := transitions(start, input[0])
		for _, state := range nextS {
			wg.Add(1)
			go checkState(transitions, state, final, input[1:len(input)], wg, mux,val)//recursion
		}
	}

	val <- false
	wg.Done()
}
