import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
@Entry
@Component
struct ArkPage {
  @State message: string = 'ArkPage'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()
        Button("login").onClick(()=>{
          router.pushUrl({url:"@bundle:com.hmos.simple/features/login/ets/pages/LoginPage"})
        }).scale({
            centerX:'50%',
            centerY:'50%',
        }).animation({
            duration:3000,
            tempo:1,
            curve:Curve.EaseIn,
            playMode:PlayMode.Reverse,
            onFinish:()=>{
              promptAction.showToast({message:"动画结束"})
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}