import Data.Vect



readVectLen : (len : Nat) -> IO (Vect len String)
readVectLen Z = pure []
readVectLen (S k) = do 
    x <- getLine
    xs <- readVectLen k
    pure (x :: xs)

data VectUnknown : Type -> Type where
    MkVect : (len : Nat) -> Vect len a -> VectUnknown a 

readVect : IO (VectUnknown String)
readVect = do 
    x <- getLine
    if (x == "")
        then pure (MkVect _ [])
        else do MkVect _ xs <- readVect
                pure (MkVect _ (x :: xs))

printVect : Show a => VectUnknown a -> IO ()
printVect (MkVect len xs) = putStrLn (show xs ++ " (length " ++ show len ++ ")")

interface Foldable (t : Type -> Type) where
    foldr : (func : elem -> acc -> acc) -> (init : acc) -> (input : t elem) -> acc
    foldl : (func : acc -> elem -> acc) -> (init : acc) -> (input : t elem) -> acc
    foldl f z t = foldr (flip (.) . flip f) id t z



-- foldr (+) 0 [1..1000000] -->

-- 1 + (2 + (3 + (4 + (... + (999999 + (1000000 + 0))...)))) -->
-- 1 + (2 + (3 + (4 + (... + (999999 + 1000000)...)))) -->
-- 1 + (2 + (3 + (4 + (... + 1999999 ...)))) -->

-- 1 + (2 + (3 + (4 + 500000499990))) -->
-- 1 + (2 + (3 + 500000499994)) -->
-- 1 + (2 + 500000499997) -->
-- 1 + 500000499999 -->
-- 500000500000


-- 通过　flip f 
-- --------------------------------------------------------------------
-- ((((...((1000000 + 0) + 999999) + ...) + 4) + 3) + 2) + 1


-- 通过　flip (.)
-- --------------------------------------------------------------------
-- (1000000 + (999999 + (... + (4 + (3 + (2 + (1 + 0))))...)))