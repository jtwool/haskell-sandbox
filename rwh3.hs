-- Chapter 3 of RealWorldHaskell from book.RealWordHaskell.org
-- New and custom data types

data BookInfo = Book Int String [String]
                deriving (Show)
                
data MagazineInfo = Magazine Int String [String]
                    deriving (Show)
                    
harryPotter = Book 023998412309 "Harry Potter" ["J.K. Rowling"]
elementsOfStyle = Book 381791875 "The Elements of Style" ["Strunk","White"]

type CustomerID = Int
type ReviewBody = String
data BookReview = BookReview BookInfo CustomerID ReviewBody


comment = BookReview harryPotter 3412341 "This is among the greatest works of fantasy. A true successor to the legacy left by the world of J.R.R. Tolkien is the story of a boy wizard who, against all odds, saves the world from the powers of evil. Throughout the story, we learn more about Harry's legendary past, supernatural abilities, and heroic fate."

type BookRecord = (BookInfo, BookReview)

type CardHolder = String
type CardNumber = String
type Address = [String]

data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOnDelivery
                 | Invoice CustomerID
                   deriving (Show)
                   
goldCard = CreditCard "0293840138098" "J.T. Wolohan" ["107 S. Indiana Avenue","Bloomington, IN"]

-- Shape Union test

type Vector = (Double, Double)
data Shape = Circle Vector Double
           | Poly [Vector]
             deriving (Show)