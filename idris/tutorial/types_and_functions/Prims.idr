{- Primitive types -}

module Prims

x : Int
x = 94

foo : String
foo = "Sausage machine"

bar : Char
bar = 'Z'

quux : Bool
quux = False

{- Data Types -}

-- data Prims.Nat = Z | S Prims.Nat    -- Natural numbers

-- data Prims.List a = Nil | (::) a (Prims.List a)

{- Functions -}

plus : Nat -> Nat  -> Nat
plus Z y = y
plus (S k) y = S (Prims.plus k y)

mult : Nat -> Nat  -> Nat
mult Z y = Z
mult (S k) y = Prims.plus y (Prims.mult k y)

-- Where clauses

reverse : List a -> List a
reverse xs = revAcc [] xs where
    revAcc : List a -> List a -> List a
    revAcc acc [] = acc
    revAcc acc (x :: xs) = revAcc (x :: acc) xs