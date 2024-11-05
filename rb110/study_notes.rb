# Return values for common Enumerable methods
# each, select, map, reduce, inject, each_with_index
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
