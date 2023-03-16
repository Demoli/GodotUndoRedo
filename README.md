# Undo / Redo node based on Memento pattern

https://medium.com/design-patterns-in-python/memento-pattern-eba610b3b59c

## Usage

Add an Undoer node to your scene and set the target to the node you want to track (by default this is the current parent node).

To save state call call `$Undoer.save_state` with a dictionary of properties you want to save

To undo call `$Undoer.undo` this will apply the previous state to your target node

To redo call `$Undoer.redo` this will apply the next saved sate to your target node

To clear all state call `$Undoer.clear`

## Events

The Undoer also emits `undone` and `redone` events with the state that has been applied.

# Restrictions 

This is currently intended to handle properties on the parent object, method calls or properties on child nodes won't work at this time, but may be added later.
