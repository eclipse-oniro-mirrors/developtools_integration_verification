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
import { image } from '@kit.ImageKit';
import { ComponentContent } from '@kit.ArkUI';

class Params {
  imageSrc: string | undefined | null  = '';

  constructor(text: string | undefined | null ) {
    this.imageSrc = text;
  }
}

@Builder
function buildImage(params: Params) {
  ReusableChildComponent({
    imageSrc: params.imageSrc
  })
}

@Component
struct ReusableChildComponent {
  @Prop imageSrc: string | undefined | null  = '';

  aboutToReuse(params: Record<string, object>) {
    console.log('ReusableChildComponent Reusable ' + JSON.stringify(params));
  }

  aboutToRecycle(): void {
    console.log('ReusableChildComponent aboutToRecycle ' + this.imageSrc);
  }

  build() {
    Column() {
      Image(this.imageSrc)
        .width(110)
        .height(110)
        .margin(15)
        .objectFit(ImageFit.None)
        .overlay('JPG Image', {
          align: Alignment.Center,
          offset: {
            x: 0,
            y: 20
          }
        })
    }
    .backgroundColor('#FFF0F0F0')
  }
}

@Entry
@Component
struct UIComponentSnapshotComponentContent0490 {
  @State name: string = 'UIComponentSnapshotComponentContent0490';
  @State message: string = this.name;
  @State imageSrc: string = '/images/image.jpg';
  @State delayValue: number | undefined = 320;
  @State checkImageStatusValue: boolean | undefined = true;
  @State scaleValue: number | undefined = 2;
  @State waitUntilRenderFinishedValue: boolean | undefined = true;

  @State pixmap: image.PixelMap | undefined = undefined;
  uiContext: UIContext = this.getUIContext();
  switchedFlag: boolean = false;

  build() {
    Row() {
      Column() {
        Text(this.message)
          .margin(10)

        Button('点击生成组件截图')
          .onClick(() => {
            let uiContext = this.getUIContext();
            let contentNode = new ComponentContent(uiContext, wrapBuilder(buildImage), new Params(this.imageSrc));
            this.uiContext.getComponentSnapshot()
              .createFromComponent(
                contentNode,
                this.delayValue,
                this.checkImageStatusValue,
                {
                  scale: this.scaleValue,
                  waitUntilRenderFinished: this.waitUntilRenderFinishedValue
                }
              )
              .then((pixmap: image.PixelMap) => {
                this.pixmap = pixmap;
                this.message += '\ngetComponentSnapshot succeed.';
              })
              .catch((err: Error) => {
                console.error('error: ' + err);
                this.message += '\ngetComponentSnapshot error: ' + JSON.stringify(err);
              })
          })
          .id(this.name + '_01')
          .margin(10)

        Button('点击切换参数')
          .onClick(() => {
            if (this.switchedFlag) {
              this.delayValue = 320;
              this.checkImageStatusValue = true;
              this.scaleValue = 2;
              this.waitUntilRenderFinishedValue = true;
              this.switchedFlag = !this.switchedFlag;
            } else {
              this.delayValue = undefined;
              this.checkImageStatusValue = false;
              this.scaleValue = undefined;
              this.waitUntilRenderFinishedValue = undefined;
              this.switchedFlag = !this.switchedFlag;
            }
          })
          .id(this.name + '_02')
          .margin(10)

        Image(this.pixmap)
          .margin(10)
          .height(200)
          .width(200)
          .objectFit(ImageFit.None)
          .border({
            color: Color.Black,
            width: 2
          })
      }
      .width('100%')
      .margin({
        left: 10,
        top: 5,
        bottom: 5
      })
      .height('24.59%')
    }
    .width('100%')
    .height('100%')
  }
}