import promptAction from '@ohos.promptAction'
import { addHSPNormal, addHSPofC, HspFirstPage, Res } from 'hsplibrary'
import router from '@ohos.router'

@Entry
@Component
struct HspTestPage {
  @State message: string = 'hsp测试页'

  build() {
    Row() {
      Column() {
        //页面
        HspFirstPage()
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button("entry模块调用hsp的native方法").onClick(() => {
          //应用hsp native方法，这里貌似不能直接使用该hsp中的c方法？？？？会编译报错
          //promptAction.showToast({ message: "应用hsp native方法"+addHSPNapi(6,6) })
          //Error message: failed to load module'hsp@app:com.hmos.simple/entry/rary/oh_modules/@types/libhsplibrary' which imported by 'com.hmos.simple/entry/ets/pages/HspTestPage'. Please check the target path.
          promptAction.showDialog({
            title: "entry模块调用hsp的native方法",
            message: `Test NAPI 1 + 1 = ${addHSPofC(1, 1)}`
          })
        })
        Button("entry模块调用hsp的普通方法").onClick(() => {
          promptAction.showDialog({
            title: "entry模块调用hsp的普通方法",
            message: `Test hsp 1 + 2 = ${addHSPNormal(1, 2)}`
          })
        }).margin({ top: 20 })
        //资源使用
        Image(Res.getIcon())
          .backgroundColor(Res.getHspColor())
          .objectFit(ImageFit.Contain).sourceSize({ width: 100, height: 100 })
          .height(200)

        Button("entry模块调用hsp的页面").onClick(() => {
          router.pushUrl({ url: "@bundle:com.hmos.simple/hsplibrary/ets/pages/HspFirstPage" })
        }).margin({ top: 20 })
      }
      .width('100%')
    }
    .height('100%')
  }
}