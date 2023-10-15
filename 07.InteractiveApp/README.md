# Interactive App

## Control and Action - UIKit 

### 상태값 관리

- 스위치(UISwitch) : isOn 프로퍼티로 자체 상태값
- 슬라이더(UISlider) : value 프로퍼티로 자체 상태값


### 이벤트 핸들러

#### Target-Action

전통적인 방법
- Target : 컨트롤의 이벤트를 처리하는 객체
- Action : 이벤트 처리  함수. Selector 타입
- Event : 컨트롤 이벤트. 버튼 클릭의 경우 TouchUpInside

```
button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
```


#### ButtonConfiguration과 UIAction

iOS15 이후 사용
- configuration : UIButton.Configuration 버튼 형태
- primaryAction : UIAction 버튼 이벤트 핸들러


UIButton.Configuration
- title : 버튼 이름
- buttonSize : 버튼 크기

UIAction
- handler : 이벤트 핸들러


```
var config = UIButton.Configuration.bordered()
config.title = "Button Title"
config.buttonSize = .medium

let button = UIButton(
    configuration: config,
    primaryAction: UIAction(handler: { action in
    print("버튼 클릭")
}))

```

### Modal dialog

UIAlertController



## Control and Action - SwiftUI


### Modal dialog



Modal Presentation 참고
https://developer.apple.com/documentation/swiftui/modal-presentations


