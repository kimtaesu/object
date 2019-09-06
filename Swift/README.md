## Java를 Swift 로 옮기면서 모호했던 부분

### Java 에서는 "Class" 로 선언되어 있지만 Swift 에서 "struct" 을 어떻게 표현해야 할지?
 - 데이터 모델로 판단되는 class 는 struct 선언하였습니다.

### Java 에서는 "abstract class" 선언되어 있지만 Swift "abstract" 키워드가 없기 때문에 어떻게 표현해야 할지? 
 - 부모에 abstract 키워드가 있으면 상속하도록 하였습니다.
 
 부모의 override 함수
 ```
 public func calculateDiscountAmount() -> Money {
        fatalError("Not implements")
    }
 ```

자식의 override 함수
 ```
override func calculateDiscountAmount() -> Money {
    return discountAmount
}
 ```

 - 부모에 abstract 키워드가 없으면 protocol로 정의하였습니다.

### 시간 관련 Class 정의 

| Java          | Swift        |
|---------------|--------------|
| LocalDateTime | Date         |
| Duration      | TimeInterval |
