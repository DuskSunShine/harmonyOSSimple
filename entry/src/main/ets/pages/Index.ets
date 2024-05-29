import { HarNapiAdd, HarNapiAdd2, MainPage} from 'harlibrary'
import promptAction from '@ohos.promptAction'
import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State message: string = 'entry模块的页面'

  build() {
    Row() {
      Column() {
        //应用har页面
        MainPage()
        Text(this.message)
          .fontColor(Color.White)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button("entry模块调用har的native方法").onClick(()=>{
          //应用har native方法，这里貌似不能直接使用该har中的c方法？？？？会编译报错
          //promptAction.showToast({ message: "应用har native方法"+add(6,6) })
          promptAction.showDialog({
            title:"entry模块调用har的native方法1",
            message:`Test NAPI 1 + 1 = ${HarNapiAdd(1,1)}`
          })
        })

        Button("entry模块调用har的native方法2").onClick(()=>{
          promptAction.showDialog({
            title:"entry模块调用har的native方法2",
            message:`Test NAPI 1 + 1 = ${HarNapiAdd2(1,1)}`
          })
        }).margin({top:20})
        //没有效果
        Button("entry模块调用har的页面").onClick(()=>{
          router.pushUrl({url:"@bundle:com.hmos.simple/harlibrary/ets/components/mainpage/MainPage"})
        }).margin({top:20})
      }
      .width('100%')
    }
    .height('100%').backgroundColor(Color.Gray)
  }
}