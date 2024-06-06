import CommonConstants from '../common/constants/CommonConstants';
import prompt from '@ohos.promptAction';
import router from '@ohos.router';
//样式定义
//文本Text
@Extend(Text)
function blueTextStyle() {
  .fontColor($r('app.color.login_blue_text_color'))
  .fontSize($r('app.float.small_text_size'))
  .fontWeight(FontWeight.Medium)
}

@Extend(Line)
function lineStyle() {
  .width(CommonConstants.FULL_PARENT)
  .height($r('app.float.line_height'))
  .backgroundColor($r('app.color.line_color'))
}

@Extend(TextInput)
function inputStyle() {
  .placeholderColor($r('app.color.placeholder_color'))
  .height($r('app.float.login_input_height'))
  .fontSize($r('app.float.big_text_size'))
  .backgroundColor($r('app.color.background'))
  .width(CommonConstants.FULL_PARENT)
  .padding({ left: CommonConstants.INPUT_PADDING_LEFT })
  .margin({ top: $r('app.float.input_margin_top') })
}


@Entry
@Component
struct LoginPage {
  @State account: string = '';
  @State password: string = '';

  @Builder
  imageButton(src: Resource) {
    Button({ type: ButtonType.Circle, stateEffect: true }) {
      Image(src)
    }
    .height($r('app.float.other_login_image_size'))
    .width($r('app.float.other_login_image_size'))
    .backgroundColor($r('app.color.background'))
  }

  login():void{
    if(this.account === '' || this.password === ''){
      prompt.showToast({
        message: $r('app.string.input_empty_tips')
      });
    }else{
      router.pushUrl({url:'pages/MainPage'})
    }
  }

  build() {
    Column() {
      //登录图片
      Image($r('app.media.logo'))
        .width($r('app.float.logo_image_size'))
        .height($r('app.float.logo_image_size'))
        .margin({ top: $r('app.float.logo_margin_top'), bottom: $r('app.float.logo_margin_bottom') })
      //title
      Text($r('app.string.login_page'))
        .fontSize($r('app.float.page_title_text_size'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_text_color'))
      //subtitle
      Text($r('app.string.login_more'))
        .fontSize($r('app.float.normal_text_size'))
        .fontColor($r('app.color.login_more_text_color'))
        .margin({ bottom: $r('app.float.login_more_margin_bottom'), top: $r('app.float.login_more_margin_top') })
      //输入框
      TextInput({ placeholder: $r('app.string.account') })
        .maxLength(CommonConstants.INPUT_ACCOUNT_LENGTH)
        .inputStyle()
        .type(InputType.Number)
        .onChange((value:string) => {
          this.account = value
        })
      //Text(this.account)

      Line().lineStyle()

      TextInput({ placeholder: $r('app.string.password') })
        .maxLength(CommonConstants.INPUT_PASSWORD_LENGTH)
        .inputStyle()
        .type(InputType.Password)
        .onChange((value:string) => {
          this.password = value
        })
      //Text(this.password)

      Line().lineStyle()
      //提示
      Row() {
        Text($r('app.string.message_login')).blueTextStyle()
        Text($r('app.string.forgot_password')).blueTextStyle()
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width(CommonConstants.FULL_PARENT)
      .margin({ top: $r('app.float.forgot_margin_top') })
      //登录按钮
      Button($r('app.string.login'), { type: ButtonType.Capsule })
        .width(CommonConstants.BUTTON_WIDTH)
        .height($r('app.float.login_button_height'))
        .fontSize($r('app.float.normal_text_size'))
        .fontWeight(FontWeight.Medium)
        .backgroundColor($r('app.color.login_button_color'))
        .margin({ top: $r('app.float.login_button_margin_top'), bottom: $r('app.float.login_button_margin_bottom') })
        .onClick(() => {
          this.login();
        })
      //注册账号
      Text($r('app.string.register_account'))
        .fontColor($r('app.color.login_blue_text_color'))
        .fontSize($r('app.float.normal_text_size'))
        .fontWeight(FontWeight.Medium)

      Blank()

      //其他方式
      Text($r('app.string.other_login_method'))
        .fontColor($r('app.color.other_login_text_color'))
        .fontSize($r('app.float.little_text_size'))
        .fontWeight(FontWeight.Medium)
        .margin({ top: $r('app.float.other_login_margin_top'), bottom: $r('app.float.other_login_margin_bottom') })

      Row({ space: CommonConstants.LOGIN_METHODS_SPACE }) {
        this.imageButton($r('app.media.login_method1'))
        this.imageButton($r('app.media.login_method2'))
        this.imageButton($r('app.media.login_method3'))
        // Button({ type: ButtonType.Circle, stateEffect: true }) {
        //   Image($r('app.media.login_method1'))
        // }
        // .height($r('app.float.other_login_image_size'))
        // .width($r('app.float.other_login_image_size'))
        // .backgroundColor($r('app.color.background'))
        //
        // Button({ type: ButtonType.Circle, stateEffect: true }) {
        //   Image($r('app.media.login_method2'))
        // }
        // .height($r('app.float.other_login_image_size'))
        // .width($r('app.float.other_login_image_size'))
        // .backgroundColor($r('app.color.background'))
        //
        // Button({ type: ButtonType.Circle, stateEffect: true }) {
        //   Image($r('app.media.login_method3'))
        // }
        // .height($r('app.float.other_login_image_size'))
        // .width($r('app.float.other_login_image_size'))
        // .backgroundColor($r('app.color.background'))

      }
    }
    .backgroundColor($r('app.color.background'))
    .height(CommonConstants.FULL_PARENT)
    .width(CommonConstants.FULL_PARENT)
    .padding({
      left: $r('app.float.page_padding_hor'),
      right: $r('app.float.page_padding_hor'),
      bottom: $r('app.float.login_page_padding_bottom')
    })
  }
}