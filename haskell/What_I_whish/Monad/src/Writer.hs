module Writer where

newtype Writer w a = Writer {runWriter :: (a, w)}

type MyWriter = Writer [Int] String

example :: MyWriter
example = do
  tell [1 .. 3]
  tell [3 .. 5]
  return "foo"

output :: (String, [Int])
output = runWriter example

instance Functor (Writer w) where
  fmap f m = Writer $ let (a, w) = runWriter m in (f a, w)

instance Monoid w => Applicative (Writer w) where
  pure a = Writer (a, mempty)
  wf <*> m =
    Writer $
      let (f, w) = runWriter wf
          (a, w') = runWriter m
       in (f a, w `mappend` w')

instance Monoid w => Monad (Writer w) where
  return a = Writer (a, mempty)
  m >>= k =
    Writer $
      let (a, w) = runWriter m
          (b, w') = runWriter (k a)
       in (b, w `mappend` w')

execWriter :: Writer w a -> w
execWriter m = snd (runWriter m)

tell :: w -> Writer w ()
tell w = Writer ((), w)