module Main where

import Prelude -- hiding ( foldl, foldr )
import HigherOrderFunctions

main :: IO ()
main = do
  putStrLn "hello world 2"

-- below is double written with if then else:
-- dbl a = if null a then [] else ( (2 * head a) : ( dbl (tail a) ) )

-- double via Simple pattern matching
dbl [] = []
dbl (x:xs) = (2 * x) : (dbl xs)

-- double via case :
dbl' nums = case nums of
    []      -> []
    (x:xs)  -> (2 * x) : (dbl xs)

-- pow2 n = if n == 0 then 1 else 2 * (pow2 (n-1))
pow2 n
    | n == 0    = 1
    | otherwise = 2 * pow2 (n-1)


-- remOdd a =
--     if null a
--     then []
--     else
--         if ( mod (head a) 2) == 0  -- keep if it is even
--         then ( head a ) : ( remOdd ( tail a ) )
--         else remOdd (tail a)       -- remove if odd


-- a modified version of the above remove off function using guards
remOdd  [] = []
remOdd  (x:xs)
    | mod x 2 == 0      = x : ( remOdd  xs )        -- keep if even
    | otherwise         = remOdd xs                 -- remove if odd

anyEven nums = case ( remOdd nums ) of
    []      -> False        -- no even numbers, empty array returned
    (x:xs)  -> True         -- even numbers present, even numbers returned


anyEvenWithDisp nums = case ( remOdd nums ) of
    []      -> (False, [])      -- no even numbers, empty array returned
    (x:xs)  -> (True, (x:xs))   -- even numbers present, even numbers returned


-- ^^ Cannot use guards with case


boro (a,b,c) = a
mejo (a,b,c) = b
choto (a,b,c) = c


-- Let binding
fancyNine =
    let a = 5
        b = 4
    in a + b


numEven nums =
    let evens = remOdd nums
    in length evens


-- where binding. Only works in function definitions
-- ex: 1 : works
fancyTen = x + y
    where   x = 6
            y = 4

-- ex: 2 : does not work
-- fancyTenWrong = 2 * ( a where a = 5) -- this is a func expression. where wont work here
-- let bindings, however work in expressions
fancyTenRight = 2 * ( let a = 5 in a + 0)


-- lazy eval : infinite lists
intsFrom n = n : intsFrom (n+1)
ints = intsFrom 1

-- *Main> take 20 ints  -- [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
-- *Main> anyEvenWithDisp (take 20 ints)  -- (True,[2,4,6,8,10,12,14,16,18,20])