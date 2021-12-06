# Advent of Code, one language a day

## Day 1. C

I started with the basics. When I grew up, it was believed that C was a good first language for children. C was a decent tool to solve day 1 in an imperative manner, changing a counter while iterating through a stream.

## Day 2. VisiData, Fish shell, sed, Microsoft Excel

Spreadsheets were excellent for solving this problem. First part was just a simple frequency table, a built-in function of spreadsheets. In the second part, values of items depended on previous items, but a simple Excel formula pasted into each cell was enough.

## Day 3. Smalltalk

I used Pharo Smalltalk for this. Pharo really has gotten good Git integration since last time I tried to use it. But the GUI is aged and/or excentric. For example, in order to resize a window you have to first focus it, unlike any other window managers in any GUI system. Pharo has had 10 years to make a decent workaround for the lack of high-resolution screen support but there is still no way to configure Pharo so that fonts don't look either blurry or unreadably small. It is reasonably easy to navigate code and refactor in Pharo. The standard library had the functions needed to solve day 3 without too much trouble.

## Day 4. Common Lisp

This was also not as fun as I had hoped. For example, even though it is a list processor, Lisp doesn't have a "chunk list" function that splits a list into sublists of a given size. It was "easy" to implement such a function though -- not many lines from Stack Overflow, however, I did not understand them.

Also Lisp doesn't assume that one would want to transform data using the basic higher-order functional style with map, flatmap, reduce, filter and so on. Definitely in the mother of functional programming languages, one would assume that these functions would be provided out of the box. Although these functions mostly do exist but with idiosyncratic names such as mapcar, mapcan, remove-if and remove-if-not, Lisp users believe it is much better to use their macros like "loop" and "dotimes" along with mutable variables, turning the language into BASIC by magic. The rationale is that since Common Lisp doesn't specify tail-call optimization, it is dangerous to use map, flatmap, reduce because they can have unbounded resource usage without tail-call optimization -- a lot of recursing can take up a lot of memory. Almost all Common Lisp implementations have tail-call optimization, though.

Working with the debugger and Emacs integration was also not as great as I had hoped. I couldn't figure out how to get from a runtime error to the actual line of code in my application that originated the error. Maybe there is a way to read those stack traces that I would figure out if I spent more time on it. Or I should have been more careful writing and testing smaller functions.

## Day 5. Java

I had some trouble creating a project in IntelliJ, but after that, most of the code writes itself, IntelliJ generates it for you. Even though this object-oriented language is more bloated and the IDE in theory much more primitive than Pharo Smalltalk's, it felt like God wrote the Java through my hands.

## Day 6. Ruby

This day was quickest for me so far. The most obvious solution for part one can't be applied directly on part two, which required me to rewrite the calculation part and data structure. The language provided no obstacle for solving it. I was able to refactor and then switch out the calculation algorithm for a more fitting one easily.
