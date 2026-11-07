/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UIComponentMediaImagePredownload0011 {
  @State name: string = 'UIComponentMediaImagePredownload0011';
  @State message: string = 'UIComponentMediaImagePredownload0011';

  build() {
    Column() {
      Text(this.message)
        .margin(10)

      Text('网络png图片资源，可以显示：')
      Image(('https://' + 'cdn.finchina.com' + '/app/pic/homePage/V6.0_qujj_zygjjjsjdb.png@3x.png?15671'))
        .onComplete((event) => {
          this.message += '\n png image onComplete, width: ' + event?.width + ', height: ' + event?.height;
        })
        .onError((error: ImageError) => {
          this.message += '\n png image onError, err: ' + JSON.stringify(error);
        })
        .width(50)

      Text('网络svg图片资源，可以显示：')
      Image(('https://' + 'cdn.finchina.com' + '/app/pic/homePage/zygjjjsjdb.svg?9631'))
        .onComplete((event) => {
          this.message += '\n svg image onComplete, width: ' + event?.width + ', height: ' + event?.height;
        })
        .onError((error: ImageError) => {
          this.message += '\n svg image onError, err: ' + JSON.stringify(error);
        })
        .width(50)

    }
    .width('100%')
    .height('100%')
  }
}
