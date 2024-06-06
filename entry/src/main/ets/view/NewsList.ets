import promptAction from '@ohos.promptAction';
import { CommonConstant, CommonConstant as Const, PageState } from '../common/constants/CommonConstant';
import NewsViewModel, { NewsData } from '../viewmodel/NewsViewModel';



import NewsItem from './NewsItem';
import NewsModel from '../viewmodel/NewsModel';

@Component
export default struct NewsList {

  @State newsModel: NewsModel = new NewsModel();

  aboutToAppear() {
    this.newsModel.currentPage = 1;
    NewsViewModel.getNewsList(this.newsModel.currentPage, this.newsModel.pageSize, Const.GET_NEWS_LIST)
      .then((data: NewsData[]) => {
        this.newsModel.pageState = PageState.Success;
        if (data.length === this.newsModel.pageSize) {
          this.newsModel.currentPage++;
          this.newsModel.hasMore = true;
        } else {
          this.newsModel.hasMore = false;
        }
        this.newsModel.newsData = data;
      })
      .catch((err: string | Resource) => {
        promptAction.showToast({
          message: err,
          duration: Const.ANIMATION_DURATION
        });
        this.newsModel.pageState = PageState.Fail;
      });
  }


  @Builder ListLayout() {
    List() {

      ForEach(this.newsModel.newsData, (item: NewsData) => {
        ListItem() {
          NewsItem({ newsData: item })
        }
        .height($r('app.float.news_list_height'))
        .backgroundColor($r('app.color.white'))
        .margin({ top: $r('app.float.news_list_margin_top') })
        .borderRadius(Const.NewsListConstant_ITEM_BORDER_RADIUS)
      }, (item: NewsData, index?: number) => JSON.stringify(item) + index)

    }
    .width(Const.NewsListConstant_LIST_WIDTH)
    .height(Const.FULL_HEIGHT)
    .margin({ left: Const.NewsListConstant_LIST_MARGIN_LEFT, right: Const.NewsListConstant_LIST_MARGIN_RIGHT })
    .backgroundColor($r('app.color.listColor'))
    .divider({
      color: $r('app.color.dividerColor'),
      strokeWidth: Const.NewsListConstant_LIST_DIVIDER_STROKE_WIDTH,
      endMargin: Const.NewsListConstant_LIST_MARGIN_RIGHT
    })
  }

  @Builder FailLayout() {
    Image($r('app.media.none'))
      .height(Const.NewsListConstant_NONE_IMAGE_SIZE)
      .width(Const.NewsListConstant_NONE_IMAGE_SIZE)
    Text($r('app.string.page_none_msg'))
      .opacity(Const.NewsListConstant_NONE_TEXT_opacity)
      .fontSize(Const.NewsListConstant_NONE_TEXT_size)
      .fontColor($r('app.color.fontColor_text3'))
      .margin({ top: Const.NewsListConstant_NONE_TEXT_margin })
  }

  build(){
    Column() {
      if (this.newsModel.pageState === PageState.Success) {
        this.ListLayout()
      } else {
        this.FailLayout()
      }
    }
    .width(Const.FULL_WIDTH)
    .height(Const.FULL_HEIGHT)
    .justifyContent(FlexAlign.Center)

  }

}

