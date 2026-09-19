##### Swift 배열
논리적으로 서로 연관된 값들을 한 데 묶는 것은 프로그래밍에서 매우 중요하다. 목록 등을 표현할 때 이런 일련의 값들은 한꺼번에 전달되어야 관리 측면에서 여러모로 편리하다. 이럴 때 필요한 것이 **컬렉션(collection)**이다.

**배열(array)**은 **순서 있는** 값들의 컬렉션이다. 배열 내 위치는 **인덱스**로 정해지며, 어떤 값도 몇 번이든 배열에 저장될 수 있다.

배열은 일반적으로 어떤 **값들의 순서를 구분하는 것이 중요한 경우**에 사용된다. 하지만 값들의 순서에 어떤 의미가 있어야 하는 것은 아니다.

**스위프트의 배열은 어떤 종류의 값도 담을 수 있다.** **객체든 비객체든 가리지 않는다**는 뜻이다.

###### 배열 만들기
```swift
import UIKit

var bucketList: Array<String>
```
Array\<String\>의 \<String\>은 배열의 인스턴스의 종류를 나타낸다.

```swift
import UIKit

var bucketList: [String]
```
대괄호([…](#))가 Array 인스턴스로 정의한다.

```swift
import UIKit

var bucketList = ["Climb Mt. Everest"]
```
배열을 선언할 때도 스위프트의 타임 추론은 기능한다.

###### 배열 액세스하기와 수정하기
```swift
import UIKit

var bucketList: [String] = ["Climb Mt. Everest"]

bucketList.append("Fly hot ari ballon to Fiji")

print(bucketList)
```
append(\_:) 메서드는 어떤 타입이든 인수로 받아 배열에 추가한다.

```swift
import UIKit

var bucketList: [String] = ["Climb Mt. Everest"]
bucketList.append("Fly hot ari ballon to Fiji")
bucketList.append("Go on a walkabout")
bucketList.append("Scuba dive in the Great Blue Hole")
bucketList.append("Find a triple rainbow")

print(bucketList)

bucketList.remove(at: 2)

print(bucketList)
```
remove(at:) 메서드는 인덱스가 지정하는 배열 요소 하나를 제거한다.

```swift
print(bucketList.count)
```
count 프로퍼티는 배열의 항목 갯수를 리턴한다.

```swift
print(bucketList[0...2])
```
서브스크립트로 배열에서 특정 인덱스에 값을 액세스할 수 있다.

```swift
bucketList[0] = "Climb Mt. Kilimanjaro"
bucketList[2] += " in Australia"

print(bucketList)

```
배열의 개별 요소는 변수/상수와 마찬가지로 연산 처리에도 적용된다.

```swift
import UIKit

var bucketList = ["Climb Mt. Everest"]

var newItems = ["Fly hot ari ballon to Fiji",
                "Go on a walkabout",
                "Scuba dive in the Great Blue Hole",
                "Find a triple rainbow"]

for item in newItems {
    
    bucketList.append(item)
}

print(bucketList)
```
for-in 루프를 사용하여 배열 요소를 추가할 수 있다.

```swift
import UIKit

var bucketList = ["Climb Mt. Everest"]

var newItems = ["Fly hot ari ballon to Fiji",
                "Go on a walkabout",
                "Scuba dive in the Great Blue Hole",
                "Find a triple rainbow"]

bucketList += newItems

print(bucketList)

bucketList.remove(at: 2)

print(bucketList)

print(bucketList.count)

print(bucketList[0...2])

bucketList[0] = "Climb Mt. Kilimanjaro"
bucketList[2] += " in Australia"

print(bucketList)

```
배열에 += 연산자를 사용하여 다른 배열을 추가할 수 있다.

```swift
import UIKit

var bucketList = ["Climb Mt. Everest"]

var newItems = ["Fly hot ari ballon to Fiji",
                "Go on a walkabout",
                "Scuba dive in the Great Blue Hole",
                "Find a triple rainbow"]

bucketList += newItems

print(bucketList)

bucketList.remove(at: 2)

print(bucketList)

print(bucketList.count)

print(bucketList[0...2])

bucketList[0] = "Climb Mt. Kilimanjaro"
bucketList[2] += " in Australia"

print(bucketList)

bucketList.insert("Toboggan across Alaska", at: 2)

print(bucketList)
```
insert(\_:at:) 메서드를 사용하면 배열의 새 요소를 특정 인덱스 위치에 추가할 수 있다.

###### 배열의 등가
```swift
import UIKit

var bucketList = ["Climb Mt. Everest"]

var newItems = ["Fly hot ari ballon to Fiji",
                "Go on a walkabout",
                "Scuba dive in the Great Blue Hole",
                "Find a triple rainbow"]

bucketList += newItems

bucketList.remove(at: 2)
bucketList[0] = "Climb Mt. Kilimanjaro"
bucketList[2] += " in Australia"
bucketList.insert("Toboggan across Alaska", at: 2)

print(bucketList)

var myronList = [
    "Climb Mt. Kilimanjaro",
    "Fly hot ari ballon to Fiji",
    "Toboggan across Alaska",
    "Scuba dive in the Great Blue Hole in Australia",
    "Find a triple rainbow"
]

let equal = (bucketList == myronList)

print(equal)
```
두 배열의 내용이 같은지 비교할 때는 == 연산자를 사용한다.

```swift
import UIKit

var bucketList = ["Climb Mt. Everest"]

var newItems = ["Fly hot ari ballon to Fiji",
                "Go on a walkabout",
                "Scuba dive in the Great Blue Hole",
                "Find a triple rainbow"]

bucketList += newItems

bucketList.remove(at: 2)
bucketList[0] = "Climb Mt. Kilimanjaro"
bucketList[2] += " in Australia"
bucketList.insert("Toboggan across Alaska", at: 2)

print(bucketList)

var myronList = [
    "Climb Mt. Kilimanjaro",
    "Fly hot ari ballon to Fiji",
    "Toboggan across Alaska",
    "Find a triple rainbow",
    "Scuba dive in the Great Blue Hole in Australia"
]

let equal = (bucketList == myronList)

print(equal)
```
배열에는 순서가 있다. 그래서 같은 내용이 있다해도 순서가 다르면 다른 배열이다.

###### 변경할 수 없는 배열
배열의 내용을 초기화 한 다음 변경할 수 없는 배열(immutable array)도 만들 수 있다.

```swift
import UIKit

let lunches = [
    
    "Cheeseburger",
    "Veggie Pizza",
    "Chicken Caesar Salad",
    "Black Bean Burrito",
    "Falafel Wrap"
]

print(lunches)
```
변경할 수 없는 배열을 만들 때는 let 키워드를 사용한다.

---- 
##### 10. 딕셔너리
딕셔너리(Dictionary)는 데이터를 키(key)와 값(value)의 쌍으로 담아 두는 컬렉션 타입이다. 키와 값은 서로 짝을 맞춰 딕셔너리에 저장된다.

딕셔너리 인스턴스의 키는 중복되지 않아야 한다. 매핑되는 키는 반드시 하나여야 한다. 

###### 딕셔너리 만들기
```swift
import Foundation

var dict1: Dictionary<String, Double>
var dict2: [String:Double]
```
딕셔너리의 문법 구조는 var dict: Dictionary\<Key, Value\>다.

꺽쇠괄호(\<\>) 안의 요소가 key와 value의 타입이다.

딕셔너리 타입의 키는 반드시 **해시 가능(hashable)** 해야 한다. String, Int, Float, Double, Bool 모두 해시 가능하다.

[:](#) 코드는 리터럴 문법 구조를 사용한 표기이다. 
() 코드는 타입의 기본 초기화 방식을 따른 표기이다.

###### 딕셔너리에 내용물 넣기
```swift
import Foundation

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]
```
배열과 달리 딕셔너리 인스턴스의 구성 요소 순서는 보장하지 않는다.

###### 딕셔너리 액세서하기
```swift
import Foundation

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]

print("I have rated \(movieRatings.count) movies.")

let darkoRating = movieRatings["Donnie Darko"]
print(darkoRating!)

```
키 값은 대괄호([](#))를 사용하여 서브스크립트를 적용한다. 이렇게 하면 해당 키에 연결된 값이 있는지 딕셔너리를 검색한다. 지정된 키로 딕셔너리 인스턴스에 서브스크립트를 적용할 대마다 딕셔너리는 Dictionary의 값의 타입과 일치하는 **옵셔널을 리턴**한다.

딕셔너리의 값은 옵셔널로 리턴된다. 딕셔너리 타입은 존재하지 않는 키에 대한 값에 대해서 nil을 리턴할 수 있어야하기 때문에 옵셔널이 되는 것이다.

###### 딕셔너리 수정하기
```swift
import Foundation

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]

print("I have rated \(movieRatings.count) movies.")

let darkoRating = movieRatings["Donnie Darko"]
print(darkoRating!)

movieRatings["Dark City"] = 5
print(movieRatings)
```

###### 딕셔너리 업데이트
```swift
import Foundation

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]

print("I have rated \(movieRatings.count) movies.")

let darkoRating = movieRatings["Donnie Darko"]
print(darkoRating!)

movieRatings["Dark City"] = 5
print(movieRatings)

let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
    
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}
```
updateValue(\_:forKey:) 메서드는 새로운 값으로 업데이트하고 업데이트 하기 전 이전 값을 리턴한다. 리턴되는 값은 옵셔널 타입이다.

###### 딕셔너리 값 추가하기
```swift
import Foundation

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]

print("I have rated \(movieRatings.count) movies.")

let darkoRating = movieRatings["Donnie Darko"]
print(darkoRating!)

movieRatings["Dark City"] = 5
print(movieRatings)

let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
    
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}

movieRatings["The Cabinet of Dr. Caligari"] = 5
```
새로운 키에 값을 지정하면 딕셔너리에 새로운 요소로 추가된다.

###### 딕셔너리 값 제거하기
```swift
import Foundation

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]

print("I have rated \(movieRatings.count) movies.")

let darkoRating = movieRatings["Donnie Darko"]
print(darkoRating!)

movieRatings["Dark City"] = 5
print(movieRatings)

let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
    
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}

movieRatings["The Cabinet of Dr. Caligari"] = 5
print(movieRatings)

movieRatings.removeValue(forKey: "Dark City")
print(movieRatings)
```
removeValue(forKey:)  메서드는 키를 인수로 받아 해당 키-값 페어를 제거한다.

삭제하려는 키와 일치하는 페어가 없으면 딕셔너리 인스턴스에는 변화가 없다.

```swift
import Foundation

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]

print("I have rated \(movieRatings.count) movies.")

let darkoRating = movieRatings["Donnie Darko"]
print(darkoRating!)

movieRatings["Dark City"] = 5
print(movieRatings)

let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
    
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}

movieRatings["The Cabinet of Dr. Caligari"] = 5
print(movieRatings)

let removeRating = movieRatings.removeValue(forKey: "Dark City")
print(removeRating)
```
removeValue(forKey:)  메서드는 제거한 키-값 페어의 값을 리턴한다.

삭제하려는 키와 일치하는 페어가 없으면 nil을 리턴한다.

###### 딕셔너리 값 nil로 설정하기
```swift
import Foundation

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]

print("I have rated \(movieRatings.count) movies.")

let darkoRating = movieRatings["Donnie Darko"]
print(darkoRating!)

movieRatings["Dark City"] = 5
print(movieRatings)

let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
    
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}

movieRatings["The Cabinet of Dr. Caligari"] = 5
print(movieRatings)

movieRatings["Dark City"] = nil
print(movieRatings)
```
딕셔너리 요소에 값을 nil로 지정해도 removeValue(forKey:)  메서드를 사용하는 것과 결과는 동일하다. 다만 이 방법으로는 제거된 키의 값을 리턴하지 못한다.

###### 루프 적용하기
```swift
import Foundation

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]

print("I have rated \(movieRatings.count) movies.")

let darkoRating = movieRatings["Donnie Darko"]
print(darkoRating!)

movieRatings["Dark City"] = 5
print(movieRatings)

let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
    
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}

movieRatings["The Cabinet of Dr. Caligari"] = 5
print(movieRatings)

movieRatings["Dark City"] = nil
print(movieRatings)

for (key, value) in movieRatings {
    
    print("The movie \(key) was rated \(value)")
}
```
for-in 루프를 사용하여 딕셔너리 요소를 하나씩 반복해서 처리할 수 있다.

```swift
import Foundation

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]

print("I have rated \(movieRatings.count) movies.")

let darkoRating = movieRatings["Donnie Darko"]
print(darkoRating!)

movieRatings["Dark City"] = 5
print(movieRatings)

let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
    
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}

movieRatings["The Cabinet of Dr. Caligari"] = 5
print(movieRatings)

movieRatings["Dark City"] = nil
print(movieRatings)

for (key, value) in movieRatings {
    
    print("The movie \(key) was rated \(value)")
}

for movie in movieRatings.keys {
    
    print("User has rated \(movie).")
}
```
딕셔너리의 각 항목의 키와 값에 함께 액세스할 필요는 없다. 딕셔너리 타입은 키와 값에 해당하는 프로퍼티를 따로따로 가지고 있기 때문이다.

###### 변경할 수 없는 딕셔너리
```swift
import Foundation

let album = [
    "Diet Roast Beef": 268,
    "Smokey's Carpet Cleaning Service": 187,
    "Track 4": 221
]

print(album)
```
let 으로 선언된 딕셔너리 인스턴스에는 항목을 추가하거나 삭제, 변경할 수 없다.

###### 딕셔너리를 배열로 변환하기
```swift
import Foundation

let album = [
    "Diet Roast Beef": 268,
    "Smokey's Carpet Cleaning Service": 187,
    "Track 4": 221
]

print(album)

let hearedAlbumKeys = Array(album.keys)
print(hearedAlbumKeys)

let hearedAlbumValues = Array(album.values)
print(hearedAlbumValues)
```
Array()를 사용하여 딕셔너리의 키 또는 값들을 배열로 만들 수 있다.

---- 
##### 11. 집합
###### Set란 무엇인가?
Set의 값은 딕셔너리처럼 컬렉션 안에서 순서가 없다. 그리고 반복되는 값도 허용하지 않는다.

###### Set 준비하기
```swift
import Foundation

var groceryBag = Set<String>()
```
Set 키워드로 셋을 선언한다.

```swift
import Foundation

var groceryBag = Set<String>()
groceryBag.insert("Apples")
groceryBag.insert("Oranges")
groceryBag.insert("Pineapples")

print(groceryBag)
```
**insert(\_:)** 메서드로 셋에 인스턴스를 추가한다.

셋 역시 딕셔너리와 마찬가지로 저장한 순서와 표시되는 순서는 상관없다.

셋에 저장되는 인스턴스의 타입은 **Element**라는 제네릭 파라미터(generic parameter)이다.

```swift
import Foundation

var groceryBag = Set<String>()
groceryBag.insert("Apples")
groceryBag.insert("Oranges")
groceryBag.insert("Pineapples")

for food in groceryBag {
    
    print(food)
}
```
for-in 루프로 표시할 수도 있다.

```swift
import Foundation

var groceryBag = Set(["Apples", "Oranges", "Pineapple"])

for food in groceryBag {
    
    print(food)
}
```
리터럴 문법으로 Set을 정의할 수도 있다.

###### 집합 다루기
```swift
import Foundation

var groceryBag = Set(["Apples", "Oranges", "Pineapple"])

for food in groceryBag {
    
    print(food)
}

let hasBananas = groceryBag.contains("Bananas")
```
contains(\_:) 메서드로 특정 항목이 셋 인스턴스에 있는지 확인할 수 있다.

```swift
import Foundation

var groceryBag = Set(["Apples", "Oranges", "Pineapple"])

for food in groceryBag {
    
    print(food)
}

let hasBananas = groceryBag.contains("Bananas")

let friendsGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])
let commonGroceryBag = groceryBag.union(friendsGroceryBag)
```
union(\_:) 메서드는 두 컬렉션의 항목들이 중복되지 않는 새 셋 인스턴스를 리턴한다. 따라서 기존의 컬렉션에는 변화가 없다.

```swift
import UIKit

var groceryBag = Set(["Apples", "Oranges", "Pineapple"])

for food in groceryBag {
    
    print(food)
}

let hasBananas = groceryBag.contains("Bananas")

let friendsGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])
let commonGroceryBag = groceryBag.union(friendsGroceryBag)

let roommatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])
let itemsToReture = commonGroceryBag.intersection(roommatesGroceryBag)
```
intersection(\_:) 메서드는 두 컬렉션의 공통 요소를 추려서 새 셋 인스턴스를 리턴한다.

```swift
import UIKit

var groceryBag = Set(["Apples", "Oranges", "Pineapple"])

for food in groceryBag {
    
    print(food)
}

let hasBananas = groceryBag.contains("Bananas")

let friendsGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])
let commonGroceryBag = groceryBag.union(friendsGroceryBag)

let roommatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])
let itemsToReturn = commonGroceryBag.intersection(roommatesGroceryBag)

let yourSecondBag = Set(["Berries", "Yogurt"])
let roommatesSecondBag = Set(["Grapes", "Honey"])
let disjoint = yourSecondBag.isDisjoint(with: roommatesGroceryBag)
```
isDisjoint(with:) 메서드는 두 컬렉션에 같은 항목이 있는지를 확인한다.

---- 
##### 14. 열거형
**열거형(enumeration)**은 리스트 형태로 정의된 여러 케이스(case)로 인스턴스를 만들 수 있는 방법이다.

##### 열거형 기본
```swift
import Foundation

enum TextAlignment {
    
    case left
    case right
    case center
}

var alignment: TextAlignment
alignment = .right

if alignment == .right {
    
    print("We should right-align the text!")
}
```
열거형 타입의 이름은 대문자로 시작하는 것이 관례다. 이름으로 쓸 단어가 여럿이라면 캐멀(camel) 케이스로 표기한다. 반면에 변수나 함수, 열거형 케이스 등은 소문자로 시작하는 캐멀 케이스로 표기한다.

```swift
import Foundation

enum TextAlignment {
    
    case left
    case right
    case center
}

var alignment: TextAlignment
alignment = .right

switch alignment {
    
case .left:
    print("left aligned")
    
case .right:
    print("right aligned")
    
case .center:
    print("center aligned")
}
```

```swift
import Foundation

enum TextAlignment {
    
    case left
    case right
    case center
}

var alignment: TextAlignment
alignment = .right

switch alignment {
    
case .left:
    print("left aligned")
    
case .right:
    print("right aligned")
    
default:
    print("center aligned")
}
```
열거형 값에 switch를 적용할 때는 default가 필수가 아니다. 컴파일러가 이미 모든 가능한 값을 알고있기 때문이다.

```swift
import Foundation

enum TextAlignment {
    
    case left
    case right
    case center
    case justify
}

var alignment: TextAlignment
alignment = .justify

switch alignment {
    
case .left:
    print("left aligned")
    
case .right:
    print("right aligned")
    
case .center:
    print("center aligned")
    
case .justify:
    print("justified")
}
```
열거형에 switch를 적용할 때 default를 사용하면 빠진 케이스가 있어도 컴파일러 오류는 발생하지 않는다. 그러나 열거형에 케이스만 추가하고 switch를 업데이트 하지 않으면 원하는 결과로 처리하지 못한다.

switch에서 열거형 케이스를 모두 작성하면 새로 케이스를 추가할 때 컴파일러는 업데이트 할 곳을 모두 표시한다.

##### 원시값 열거형
```swift
import Foundation

enum TextAlignment: Int {
    
    case left
    case right
    case center
    case justify
}

var alignment: TextAlignment
alignment = .justify

print("Left has raw value \(TextAlignment.left.rawValue)")
print("Right has raw value \(TextAlignment.right.rawValue)")
print("Center has raw value \(TextAlignment.center.rawValue)")
print("Justify has raw value \(TextAlignment.justify.rawValue)")
print("The alignment variable has raw value \(alignment.rawValue)")
```
열거형 타입에 원시값 타입을 지정하면 그 타입의 값이 각 케이스에 지정된다. Int 타입은 첫번째 케이스의 값은 0, 그 다음 케이스의 값은 1이 된다.

```swift
import Foundation

enum TextAlignment: Int {
    
    case left = 20
    case right = 30
    case center = 40
    case justify = 50
}

var alignment: TextAlignment
alignment = .justify

print("Left has raw value \(TextAlignment.left.rawValue)")
print("Right has raw value \(TextAlignment.right.rawValue)")
print("Center has raw value \(TextAlignment.center.rawValue)")
print("Justify has raw value \(TextAlignment.justify.rawValue)")
print("The alignment variable has raw value \(alignment.rawValue)")
```
열거형의 원시값을 직접 지정할 수도 있다.

```swift
import Foundation

enum TextAlignment: Int {
    
    case left = 20
    case right = 30
    case center = 40
    case justify = 50
}

var alignment: TextAlignment
alignment = .justify

print("Left has raw value \(TextAlignment.left.rawValue)")
print("Right has raw value \(TextAlignment.right.rawValue)")
print("Center has raw value \(TextAlignment.center.rawValue)")
print("Justify has raw value \(TextAlignment.justify.rawValue)")
print("The alignment variable has raw value \(alignment.rawValue)")

let myRawValue = 20

if let myAlignment = TextAlignment(rawValue: myRawValue) {
    
    print("successfully converted \(myRawValue) into a TextAlignment. \(myAlignment)")
}
else {
    
    print("\(myRawValue) has no corresponding TextAlignment case.")
}
```
원시값이 지정된 모든 열거형 타입은 원시값을 옵셔널 열거형을 리턴하는 rawValue: 메서드로 변환할 수 있다.

리턴 타입이 옵셔널이므로 옵셔널 바인딩을 사용하면 값(또는 nil)을 가져올 수 있다.

```swift
import Foundation

enum ProgrammingLanguage: String {
    
    case swift = "swift"
    case objectiveC = "objective-c"
    case c = "c"
    case cpp = "c++"
    case java = "java"
}

let myFavoriteLanguage = ProgrammingLanguage.swift
print("My favorite programming language is \(myFavoriteLanguage.rawValue)")
```
문자열을 원시값으로 사용할 수도 있다.

```swift
import Foundation

enum ProgrammingLanguage: String {
    
    case swift
    case objectiveC = "objective-c"
    case c
    case cpp = "c++"
    case java
}

let myFavoriteLanguage = ProgrammingLanguage.swift
print("My favorite programming language is \(myFavoriteLanguage.rawValue)")
```
String 타입을 사용하는 열거형에 값을 생략하면 스위프트는 케이스 자체의 이름을 사용한다.

##### 메서드
```swift
import Foundation

enum Lightbulb {
    
    case on
    case off
    
    func surfaceTemperature(forAmbientTemperature ambient: Double) -> Double {
        
        switch self {
            
        case .on:
            return ambient + 150.0
            
        case .off:
            return ambient
        }
    }
}

var bulb = Lightbulb.on
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")
```

```swift
import Foundation

enum Lightbulb {
    
    case on
    case off
    
    func surfaceTemperature(forAmbientTemperature ambient: Double) -> Double {
        
        switch self {
            
        case .on:
            return ambient + 150.0
            
        case .off:
            return ambient
        }
    }
    
    mutating func toggle() {
        
        switch self {
            
        case .on:
            self = .off
            
        case .off:
            self = .on
        }
    }
}

var bulb = Lightbulb.on
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")

bulb.toggle()
bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")
```
스위프트에서 열거형은 값 타입(value type)이며, 값 타입의 메서드는 self를 변경할 수 없다.

값 타입의 메서드에서 self를 변경하도록 허용하려면 메서드에 mutating이라는 키워드를 붙여야 한다.

##### 연동되는 값
열거형의 모든 것은 가능성 있는 값이나 상태가 나열된 정적 케이스 정의의 범주에 있다.

```swift
import Foundation

enum ShapeDimensions {
    
    case point
    
    case square(side: Double)
    
    case rectangle(width: Double, height: Double)
    
    func area() -> Double {
        
        switch self {
            
        case .point:
            return 0
            
        case let .square(side: side):
            return side * side
            
        case let .rectangle(width: w, height: h):
            return w * h
        }
    }
}

var pointShape = ShapeDimensions.point
var squareShape = ShapeDimensions.square(side: 10.0)
var rectShape = ShapeDimensions.rectangle(width: 5.0, height: 10.0)

print("point's area = \(pointShape.area())")
print("square's area = \(squareShape.area())")
print("rectangle's area = \(rectShape.area())")
```
열거형의 케이스에 튜플을 지정할 수도 있다.

##### 재귀적 열거형
스위프트는 열거형의 어떤 인스턴스든 한 번에 하나의 케이스에만 있어야 한다. 프로그램이 실행되면서 케이스가 변경되더라도 이 규칙은 어긋나지 않는다. 따라서 컴파일러가 열거형 인스턴스에 필요한 메모리를 결정하면 어느 케이스가 가장 많은 메모리를 요구하는지 파악하고, 그 인스턴스는 해당 메모리를 요구한다. (컴파일러가 메모리 추적을 위해 1바이트가 더 추가된다.)

```swift
import Foundation

indirect enum FamilyTree {
    
    case noKnownParents
    case oneKnownParent(name: String, ancestors: FamilyTree)
    case twoKnownParents(fatherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestors: FamilyTree)
}
```
필요한 메모리를 직접 지정하지 않고, indirect라는 키워드를 지정하면 열거형의 데이터가 포인터 뒤에 저장된다.

```swift
import Foundation

enum FamilyTree {
    
    case noKnownParents
    indirect case oneKnownParent(name: String, ancestors: FamilyTree)
    indirect case twoKnownParents(fatherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestors: FamilyTree)
}
```
indirect 키워드는 열거형 전체에 붙이지 않아도 된다. 필요한 케이스에만 표기하면 된다.

```swift
import Foundation

enum FamilyTree {
    
    case noKnownParents
    indirect case oneKnownParent(name: String, ancestors: FamilyTree)
    indirect case twoKnownParents(fatherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestors: FamilyTree)
}

let fredAncestors = FamilyTree.twoKnownParents(fatherName: "Fred Sr.", fatherAncestors: .oneKnownParent(name: "Beth", ancestors: .noKnownParents), motherName: "Marsha", motherAncestors: .noKnownParents)
print(fredAncestors)

```

---- 

