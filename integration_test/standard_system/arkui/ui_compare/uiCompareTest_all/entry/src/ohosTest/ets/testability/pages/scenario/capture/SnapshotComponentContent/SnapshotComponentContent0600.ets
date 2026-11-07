/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { image } from '@kit.ImageKit';
import { ComponentContent } from '@kit.ArkUI';
import { http } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';

class Params {
  text: string | undefined | null  = '';

  constructor(text: string | undefined | null ) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  ReusableChildComponent({ text: params.text })
}

@Component
struct ReusableChildComponent {
  @Prop text: string | undefined | null  = '';
  @State pixelMapImg: PixelMap | undefined = undefined;

  aboutToAppear() {
    // this.requestImageUrl('https://images.openharmony.cn/330-%E8%BF%90%E8%90%A5%E5%9B%BE/%E5%AD%A6%E9%99%A2/530/application_basic_l.jpg');// 请填写一个具体的网络图片地址
  }

  requestImageUrl(url: string) {
    http.createHttp().request(url, (error: BusinessError, data: http.HttpResponse) => {
      if (error) {
        console.error(`request image failed: url: ${url}, code: ${error.code}, message: ${error.message}`);
      } else {
        let imgData: ArrayBuffer = data.result as ArrayBuffer;
        console.info(`request image success, size: ${imgData.byteLength}`);
        let imgSource: image.ImageSource = image.createImageSource(imgData);

        class SizeTmp {
          public height: number = 100
          public width: number = 100
        }

        let options: Record<string, number | boolean | SizeTmp> = {
          'alphaType': 0,
          'editable': false,
          'pixelFormat': 3,
          'scaleMode': 1,
          'size': { height: 100, width: 100 }
        }
        imgSource.createPixelMap(options).then((pixelMap: PixelMap) => {
          console.error('image createPixelMap success');
          this.pixelMapImg = pixelMap;
        })
        imgSource.release()
      }
    })
  }

  aboutToReuse(params: Record<string, object>) {
    console.log('ReusableChildComponent Reusable ' + JSON.stringify(params));
  }

  aboutToRecycle(): void {
    console.log('ReusableChildComponent aboutToRecycle ' + this.text);
  }

  build() {
    Column() {
      Text(this.text)
        .fontSize(90)
        .fontWeight(FontWeight.Bold)
        .width(50)
        .height(50)
      Image($r('app.media.open'))
        .width(100)
        .height(100)
    }.backgroundColor('#FFF0F0F0')
  }
}

@Entry
@Component
struct SnapshotComponentContent0600 {
  @State pixmap: image.PixelMap | undefined = undefined;
  @State message: string | undefined | null = 'hello';
  uiContext: UIContext = this.getUIContext();

  build() {
    Row() {
      Column() {
        Button('点击生成组件截图')
          .id('btn')
          .onClick(() => {
            let uiContext = this.getUIContext();
            let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText), new Params(this.message));
            this.uiContext.getComponentSnapshot()
              .createFromComponent(
                contentNode,
                undefined,          // 第一个参数：delay
                undefined,         // 第二个参数：checkImageStatus
                {
                  scale: null,                  // 第三个参数：scale设置为null
                  waitUntilRenderFinished: undefined  // 第四个参数：waitUntilRenderFinished
                }
              )
              .then((pixmap: image.PixelMap) => {
                this.pixmap = pixmap;
              })
              .catch((err: Error) => {
                console.error('error: ' + err);
              })
          })
        Image($r('app.media.cat_heif'))
          .margin(10)
          .height(300)
          .width(300)
          .border({ color: Color.Black, width: 2 })
      }.width('100%').margin({ left: 10, top: 5, bottom: 5 }).height('24.59%')
    }
    .width('100%')
    .height('100%')
  }
}

