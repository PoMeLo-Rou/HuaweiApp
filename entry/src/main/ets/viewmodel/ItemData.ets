export default class PageResource{
  //文本item
  title:Resource;
  //图片item
  img:Resource;
  //其他资源item
  others?:Resource;


  constructor(title:Resource,img:Resource,others?:Resource) {
    this.title = title;
    this.img = img;
    this.others = others;
  }
}