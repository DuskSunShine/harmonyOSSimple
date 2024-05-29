import hilog from '@ohos.hilog';
import testNapi from 'libharlibrary.so'
import promptAction from '@ohos.promptAction';
@Component
export struct MainPage {
  @State message: string = 'har lib的页面'

  build() {
    Row() {
      Column() {
        Button(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            const value = testNapi.add(2, 3)
            promptAction.showDialog({
              title:"har native lib调用内部的native方法",
              message:`Test NAPI 2 + 3 = ${value}`
            })
            hilog.info(0x0000, 'testTag', 'Test NAPI 2 + 3 = %{public}d', value)
          })
      }
      .width('100%')
    }
    .height(100).backgroundColor(Color.Green)
  }
}