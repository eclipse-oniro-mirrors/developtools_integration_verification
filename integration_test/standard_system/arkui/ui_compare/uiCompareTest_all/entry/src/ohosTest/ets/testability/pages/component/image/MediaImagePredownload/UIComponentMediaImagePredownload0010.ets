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
struct UIComponentMediaImagePredownload0010 {
  @State name: string = 'UIComponentMediaImagePredownload0010';
  @State message: string = 'UIComponentMediaImagePredownload0010';

  build() {
    Column() {
      Text(this.message)
        .margin(10)

      Text('网络图片资源png，可以显示：')
      Image(('http://' + 'rongcloud-web.qiniudn.com' + '/docs_demo_rongcloud_logo.png'))
        .onComplete((event) => {
          this.message += '\n png image onComplete, width: ' + event?.width + ', height: ' + event?.height;
        })
        .onError((error: ImageError) => {
          this.message += '\n png image onError, err: ' + JSON.stringify(error);
        })
        .width(50)
        .height(50)

      Text('网络图片资源jpg，可以显示：')
      Image(('https://' + 'appimg.dbankcdn.com' + '/substancechartimg/64/f7e291e71006440caed2f552f4dbb522.jpg'))
        .onComplete((event) => {
          this.message += '\n jpg image onComplete, width: ' + event?.width + ', height: ' + event?.height;
        })
        .onError((error: ImageError) => {
          this.message += '\n jpg image onError, err: ' + JSON.stringify(error);
        })
        .width(50)
        .height(50)

      Text('网络图片资源jpeg，可以显示：')
      Image(('https://' + 'cp1.douguo.com' + '/upload/caiku/d/e/b/600_de930a0bd7492906df26a297856dde1b.jpeg'))
        .onComplete((event) => {
          this.message += '\n jpeg image onComplete, width: ' + event?.width + ', height: ' + event?.height;
        })
        .onError((error: ImageError) => {
          this.message += '\n jpeg image onError, err: ' + JSON.stringify(error);
        })
        .width(50)
        .height(50)

      Text('网络图片资源webp，可以显示：')
      Image(('https://' + 'appimg.dbankcdn.com' + '/application/icon144/phone/61dd696a2ff14d4c8b818be7923f67a3.webp'))
        .onComplete((event) => {
          this.message += '\n webp image onComplete, width: ' + event?.width + ', height: ' + event?.height;
        })
        .onError((error: ImageError) => {
          this.message += '\n webp image onError, err: ' + JSON.stringify(error);
        })
        .width(50)
        .height(50)

      Text('网络图片资源gif，可以显示：')
      Image(('https://' + 'c-ssl.duitang.com' + '/uploads/blog/202207/27/20220727161756_ad6f5.gif'))
        .onComplete((event) => {
          this.message += '\n gif image onComplete, width: ' + event?.width + ', height: ' + event?.height;
        })
        .onError((error: ImageError) => {
          this.message += '\n gif image onError, err: ' + JSON.stringify(error);
        })
        .width(50)
        .height(50)

      Text('网络svg图片资源，可以显示：')
      Image(('https://' + 'cdn.finchina.com' + '/app/pic/homePage/zygjjjsjdb.svg?9631'))
        .onComplete((event) => {
          this.message += '\n svg image onComplete, width: ' + event?.width + ', height: ' + event?.height;
        })
        .onError((error: ImageError) => {
          this.message += '\n svg image onError, err: ' + JSON.stringify(error);
        })
        .width(50)

      Text('网络bmp图片资源，可以显示：')
      Image(('https://' + 'gitee.com' + '/drthrhr/test-images/raw/testImages/bmpImage.bmp'))
        .onComplete((event) => {
          this.message += '\n bmp image onComplete, width: ' + event?.width + ', height: ' + event?.height;
        })
        .onError((error: ImageError) => {
          this.message += '\n bmp image onError, err: ' + JSON.stringify(error);
        })
        .width(50)

    }
    .width('100%')
    .height('100%')
  }
}
