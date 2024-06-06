@Entry
@Component
struct DemoPage {
  @State message: string = 'Hello World'

  private arr:number[] = [1,2,3,4,5,6,7,8,9,10,11,12];

  build() {
    Column(){
      Grid(){
        ForEach(this.arr, (item:number) => {
          GridItem(){
            Text(`${item}`)
              .fontSize(16)
              .fontColor(Color.White)
              .backgroundColor(0x007DFF)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
        },item => item)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .height(300)


      List({space:10}){
        ForEach(this.arr, (item:number) => {
          ListItem(){
            Text(`${item}`)
              .width('100%')
              .height(100)
              .fontSize(20)
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0x007DFF)
          }
        },item => item)
      }

    }
     .width('100%')
     .height('100%')
  }
}