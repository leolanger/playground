import Data.Vect

insSort_rhs_2 : Ord elem => (x : elem) -> (xsSorted : Vect len elem) -> Vect (S len) elem
insSort_rhs_2 x [] = [x]
insSort_rhs_2 x (y :: xs) = case x < y of
                                 False => y :: insSort_rhs_2 x xs
                                 True => x :: y :: xs



insSort : Ord elem => Vect n elem -> Vect n elem
insSort [] = []
insSort (x :: xs) = let xsSorted = insSort xs in
                        insSort_rhs_2 x xsSorted
