import CommonConstants from '../common/constants/CommonConstants'
import mainViewModel from '../viewmodel/MainViewModel'
import ItemData from '../viewmodel/ItemData'


@Component
export default struct HomeDemo {
  private swiperController: SwiperController = new SwiperController();
  build() {
    Row() {
      Column() {

        //标题
        Column(){
          Text($r('app.string.mainPage_tabTitles_home'))
            .fontWeight(FontWeight.Medium)
            .fontSize($r('app.float.page_title_text_size'))
            .margin({ top: $r('app.float.mainPage_tabTitles_margin') })
            .padding({ left: $r('app.float.mainPage_tabTitles_padding') })
        }
        .width(CommonConstants.FULL_PARENT)
       .alignItems(HorizontalAlign.Start)

        //轮播
        //图片的数组有了
        // Swiper(this.swiperController){
        //   ForEach(mainViewModel.getSwiperImage(), (item: Resource) =>{
        //     Image(item)
        //   })
        // }

        Swiper(this.swiperController){
          ForEach(mainViewModel.getSwiperImage(), (item: Resource) =>{
            Image(item).borderRadius($r('app.float.home_swiper_borderRadius'))
          },(item: Resource) => JSON.stringify(item.id))
        }
        .margin({ top: $r('app.float.home_swiper_margin') })
       .autoPlay(true)
       .width('100%')
       .height(200)


        //导航菜单：网格
        Grid(){
          ForEach(mainViewModel.getFirstGridData(), (item: ItemData) => {
            GridItem(){
              Column(){
                Image(item.img)
                 .width($r('app.float.home_homeCell_size'))
                 .height($r('app.float.home_homeCell_size'))
                Text(item.title)
                 .fontSize($r('app.float.little_text_size'))
                 .margin({ top: $r('app.float.home_homeCell_margin') })
              }
            }
          })
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
       .rowsTemplate('1fr 1fr')
       .columnsGap($r('app.float.home_grid_columnsGap'))
       .rowsGap($r('app.float.home_grid_rowGap'))
       .padding({ top: $r('app.float.home_grid_padding'), bottom: $r('app.float.home_grid_padding') })


        //标题

        //图文列表


      }
      .width('100%')

    }
    .height('100%')
  }
}