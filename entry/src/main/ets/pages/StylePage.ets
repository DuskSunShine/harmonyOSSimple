import router from '@ohos.router'
import promptAction from '@ohos.promptAction'

@Entry
@Component
struct ArkPage {
  @State message: string = 'ArkPage'
  @State count: number = 0

  @Builder CText() {
    Text("自定义Text").fontColor(Color.Blue)
  }

  build() {
    Row() {
      Column() {
        if (this.count % 2 == 0) {
          this.CText()
        }
        Text(this.message + this.count)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.count++
          })
          .bgColor()
          .fancy(20)
        Divider()
        Button("login").onClick(() => {
          router.pushUrl({ url: "@bundle:com.hmos.simple/features/login/ets/pages/LoginPage" })
        }).scale({
          centerX: '50%',
          centerY: '50%',
        }).animation({
          duration: 3000,
          tempo: 1,
          curve: Curve.EaseIn,
          playMode: PlayMode.Reverse,
          onFinish: () => {
            promptAction.showToast({ message: "动画结束" })
          }
        })
        Text("stateStyles").stateStyles({
          clicked:{
            .bgColor()
          }
          ,normal:{
            .backgroundColor(Color.Green)
          }
        }).onClick(()=>{}).fancy(50)
      }
      .width('100%')
    }
    .height('100%')
  }

  onPageShow() {
    console.log("onPageShow页面每次显示时触发一次，包括路由过程、应用进入前台等场景")
  }

  onPageHide() {
    console.log("onPageHide页面每次隐藏时触发一次，包括路由过程、应用进入后台等场景。")
  }

  onBackPress() {
    console.log("onBackPress当用户点击返回按钮时触发")
  }

  aboutToAppear() {
    console.log("aboutToAppear组件即将出现时回调该接口，具体时机为在创建自定义组件的新实例后，在执行其build()函数之前执行")
  }

  aboutToDisappear() {
    console.log("aboutToDisappear，在自定义组件析构销毁之前执行。不允许在aboutToDisappear函数中改变状态变量，特别是@Link变量的修改可能会导致应用程序行为不稳定。")
  }
}
//带参的公共属性，只能在全局
@Extend(Text) function fancy(fontSize: number) {
  .fontColor(Color.Red)
  .fontSize(fontSize)
}

//公共属性提取封装,不带参。可定义在struct
@Styles function bgColor() {
  .backgroundColor(Color.Pink)
}