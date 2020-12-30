iseven : Nat -> Bool
iseven Z = False
iseven (S k) = not (iseven k)
