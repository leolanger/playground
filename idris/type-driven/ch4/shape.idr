data Shape = Triangle Double Double
           | Rectangle Double Double
           | Circle Double

-- data Shape : Type where
--     Triangle : Double -> Double -> Shape
--     Rectangle : Double -> Double -> Shape
--     Circle : Double -> Shape

area : Shape -> Double
area (Triangle base height) = 0.5 * base * height
area (Rectangle length height) = length * height
area (Circle radius) = pi * radius * radius
