import Data.Vect

addMatrix : Num numType => Vect rows (Vect cols numType) -> Vect rows (Vect cols numType) -> Vect rows (Vect cols numType) 
addMatrix xs ys = ?addMatrix_rhs

multMatrix : Num numType => Vect n (Vect m numType) -> Vect m (Vect p numType) -> Vect n (Vect p numType)
multMatrix xs ys = ?multMatrix_rhs

createEmpties : Vect n (Vect 0 elem)
createEmpties = replicate _ []

transposeHelper : (x : Vect n elem) -> (xsTrans : Vect n (Vect len elem)) -> Vect n (Vect (S len) elem)
transposeHelper [] [] = []
transposeHelper (x :: ys) (y :: xs) = (x :: y) :: transposeHelper ys xs

transposeMat : Vect m (Vect n elem) -> Vect n (Vect m elem)
transposeMat [] = createEmpties
transposeMat (x :: xs) = let xsTrans = transposeMat xs in
                            transposeHelper x xsTrans
