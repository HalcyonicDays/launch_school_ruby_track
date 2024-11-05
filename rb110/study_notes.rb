# Return values for common Enumerable methods
# each, select, map, reduce, inject, each_with_index, each_with_object
# => Kernel.loop(&block) returns nil
# => each returns the caller which invokes the #each method
# => each_with_index returns the caller which invokes the #each_with_index method
# => select returns a new array containing elements which evaluated as truthy
# => select! returns the original caller containing elements which evaluated as truthy
# => map returns a new array which contains the output of the block
# => map! returns the original caller, mutated to contain the output of the block 
# => reduce and inject both return the accumulated result that is generated when a method 
# => is applied to the collection.  An initial value can be supplied; otherwise the firts
# => element in the collection will act as the initial value.
# => each_with_object accepts a collection object as an argument, and this same
# => collection object (as modified by the block) is returned by the method

# Additional Enumerable notes:
# .any? and .all? methods take a block and return true if any element evaluated
# by the block is truthy for .any? and similarly, .all? returns false if any
# element evaluated by the block is falsey
# .include does not take a block, but just takes a single argument.  When called
# on a hash, .include? only checks the keys.
# >> Note: Hash.keys.include? is equivalent to Hash.key? and Hash.include?
# >> Likewise, Hash.values.include? is equivalent to Hash.value?


# Enumberable.partition is similar to a .select or .reject method, except that
# it does both at the same time.  It can be used with parallel assignment:
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

odd  # => [1, 3]  (block evaluations which return truthy)
even # => [2]     (block evaluations which return falsey)
# >> The partition function itself still returns the complete result of the
# >> evaluation: [[1, 3], [2]] ([truthy collection, (falsey collection)])

# How to pass a block to a method & call it
# - FYI, a block is like an anonymous function in Java/JavaScript
# >> a method can be defined as one which accepts a block with the following syntax:
# >> def my_method(&block); end.  The block can be called with either the 'yield' keyword,
# >> or by invoking the #call method -> block.call.
# >> a block can be passed to a method even if the method definition doesn't explicitly present
# >> a "&block" parameter, however, in this case the block can only be called/invoked.  In order
# >> to pass the block elsewhere (such as second method being called by the first), the block
# >> needs to be declared as a parameter of the method definition in order to exist in the scope
# >> in which it is being passed into, rather than simply invoked.

# >> Procs and Lambdas are somewhat less anonymous than their block counterparts and differ from
# >> one another how they handle the "return" keyword.  A Proc returns back to the method that
# >> called it, while a Lambda return is treated the same as if the return were part of the calling
# >> method, in other words, the Proc returns back to the scope it was called in and evaluation
# >> continues, while a Lambda's "parent function" ceases evaluating any further just as if it
# >> itself was the origin of the return statement.
