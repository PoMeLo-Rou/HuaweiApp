/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { CommonConstant as Const } from '../common/constants/CommonConstant';
import Logger from '../common/utils/Logger';
import { httpRequestGet } from '../common/utils/HttpUtil';

class NewsViewModel {

  /**
   * Get news type list from server.
   *
   * @return NewsData[] newsDataList
   */
  getNewsList(currentPage: number, pageSize: number, path: string): Promise<NewsData[]> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${Const.SERVER}/${path}`;
      url += '?currentPage=' + currentPage + '&pageSize=' + pageSize;
      httpRequestGet(url).then((data: ResponseResult) => {
        if (data.code === Const.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('getNewsList failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'));
        }
      }).catch((err: Error) => {
        Logger.error('getNewsList failed', JSON.stringify(err));
        reject($r('app.string.http_error_message'));
      });
    });
  }

}

let newsViewModel = new NewsViewModel();

export default newsViewModel as NewsViewModel;


/**
 * News list item info.
 */
export class NewsData {
  /**
   * News list item title.
   */
  title: string = '';

  /**
   * News list item content.
   */
  content: string = '';

  /**
   * News list item imagesUrl.
   */
  imagesUrl: Array<NewsFile> = [new NewsFile()];

  /**
   * News list item source.
   */
  source: string = '';
}

/**
 * News image list item info.
 */
export class NewsFile {
  /**
   * News image list item id.
   */
  id: number = 0;

  /**
   * News image list item url.
   */
  url: string = '';

  /**
   * News image list item type.
   */
  type: number = 0;

  /**
   * News image list item newsId.
   */
  newsId: number = 0;
}


export class ResponseResult {
  /**
   * Code returned by the network request: success, fail.
   */
  code: string;

  /**
   * Message returned by the network request.
   */
  msg: string | Resource;

  /**
   * Data returned by the network request.
   */
  data: string | Object | ArrayBuffer;

  constructor() {
    this.code = '';
    this.msg = '';
    this.data = '';
  }
}





