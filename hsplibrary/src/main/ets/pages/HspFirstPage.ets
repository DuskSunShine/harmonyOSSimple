import router from '@ohos.router'
@Entry
@Component
export struct HspFirstPage {
  @State message: string = 'hsp lib第一页面'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button("跳转到hsp第二页面").onClick(()=>{
          router.pushUrl({ url:"@bundle:com.hmos.simple/hsplibrary/ets/pages/HspPage2" })
        })
      }
      .width(200)
    }.backgroundColor(Color.Gray)
    .height(200)
  }
}