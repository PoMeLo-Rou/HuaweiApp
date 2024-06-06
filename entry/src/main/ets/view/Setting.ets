import NewsList from '../view/NewsList';
import { CommonConstant as Const } from '../common/constants/CommonConstant';

@Component
export default struct Setting {

  build() {
    Scroll(){
      Column() {
        NewsList()
      }
      .width(Const.FULL_WIDTH)
      .backgroundColor($r('app.color.listColor'))
      .justifyContent(FlexAlign.Center)
    }
  }
}