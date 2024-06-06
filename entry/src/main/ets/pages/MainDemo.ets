import Home from '../view/HomeDemo'

@Entry
@Component
struct TabsExample {
  private controller: TabsController = new TabsController()

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {
          //把home界面放入
          Home()
        }
        .tabBar('home')

        TabContent() {
          //把setting界面放入
        }
        .tabBar('setting')

      }
      .barWidth('100%') // 设置TabBar宽度
      .barHeight(60) // 设置TabBar高度
      .width('100%') // 设置Tabs组件宽度
      .height('100%') // 设置Tabs组件高度
      .backgroundColor(0xF5F5F5) // 设置Tabs组件背景颜色
    }
    .width('100%')
    .height('100%')
  }
}