module hello

main : IO ()
main = return ()

app : Vect n a -> Vect m a -> Vect (n + m) a
