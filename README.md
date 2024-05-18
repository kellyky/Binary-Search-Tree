Binary Search Tree in Ruby, written to the Odin Project's Binary Search Tree exercise's specifications. 

## Requirements
Requires Ruby - written with version 3.3.0. 

## Usage
1. Clone the repo and `cd` into it
2. Note: You will need to `gem install pry-byebug` (or delete `require 'pry-byebug'` from the files before proceeding).
3. Run the script: `ruby main.rb`

## Functionality - what happens when you run `ruby main.rb`
`main.rb` is a driver script that does the following:

- Creates a binary search tree from an array of random numbers (Array.new(15) { rand(1..100) })
- Confirms that the tree is balanced by calling #balanced?
- Prints out all elements in level, pre, post, and in order
- Unbalances the tree by adding several numbers > 100
- Confirms that the tree is unbalanced by calling #balanced?
- Balances the tree by calling #rebalance
- Confirms that the tree is balanced by calling #balanced?
- Prints out all elements in level, pre, post, and in order

**Example**:

<img width="671" alt="Screenshot 2024-05-18 at 4 07 25 PM" src="https://github.com/kellyky/Binary-Search-Tree/assets/4626639/9b37de9a-e23b-4d5d-9b4b-c69c04879330">

<img width="568" alt="Screenshot 2024-05-18 at 4 15 58 PM" src="https://github.com/kellyky/Binary-Search-Tree/assets/4626639/5dfa731c-f4d4-401d-9e2b-f35afffde96f">
