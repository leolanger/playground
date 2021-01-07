data Shape = Triangle Double Double
           | Rectangle Double Double
           | Circle Double

data Picture = Primitive Shape
             | Combine Picture Picture
             | Rotate Double Picture
             | Translate Double Double Picture

