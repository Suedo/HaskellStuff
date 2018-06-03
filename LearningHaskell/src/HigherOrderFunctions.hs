module HigherOrderFunctions where

pass3to f = f 3
add10 x = x + 10
mul20 x = 20 * x

-- pass3to add10 		-- 13

comp' f g x = f (g x)

foo x y z = x + y + z
foo_5_2 = foo 5 2
-- foo_5_2 200   -- 207
-- partial application arguments MUST be given in proepr order


-- Operators in Haskell are also functions. To use them as functions, pass them within parens
-- (+) 5 3   -- 8
-- :t (+)    -- (+) :: Num a => a -> a -> a

-- Creating a new operator .+ using pattern matching
(a,b) .+ (c,d) = (a+c,b+d)

pass_3_4_to f = f 3 4



-- filter
evens x = x `mod` 2 == 0
removeOdds (xs) = filter evens (xs)
-- removeOdds [1..20] 		-- [2,4,6,8,10,12,14,16,18,20]

-- :t fst
-- fst :: (a, b) -> a
-- :t snd
-- snd :: (a, b) -> b
x = map snd ( filter fst [(True,5),(False,2),(True,10)] )
-- x >> [5,10]


dbl_v2 xs = map (2*) xs
-- dbl_v2 [2..5]    -- [4,6,8,10]

-- filter (not.evens) (map (47*) [100..200])
-- [4747,4841,4935,5029,5123,5217,5311,5405,5499,5593,5687,5781,5875,5969,6063,6157,6251,6345,6439,6533,6627,6721,6815,6909,7003,7097,7191,7285,7379,7473,7567,7661,7755,7849,7943,8037,8131,8225,8319,8413,8507,8601,8695,8789,8883,8977,9071,9165,9259,9353]


-- .............................................................................................................................
--      FOLD
-- .............................................................................................................................

-- foldl and foldr come by defalt in Prelude. Read this to understand better about folding 
-- https://wiki.haskell.org/Foldr_Foldl_Foldl%27
-- map ((1+).(2*)) [1..5]                   -- [3,5,7,9,11]  -- map (f(g x)) [some list] // f(g(x)) >> 1st g(x), then f() over the return
-- foldl (+) 0 (map ((1+).(2*)) [1..5])     -- 35



-- .............................................................................................................................
--      ZIP
-- .............................................................................................................................
-- :t zip                           -- zip :: [a] -> [b] -> [(a, b)]
-- zip [1..5] [10..15]              -- [(1,10),(2,11),(3,12),(4,13),(5,14)]
-- :t zipWith                       -- zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
-- zipWith (+) [1..5] [10..15]      -- [11,13,15,17,19]