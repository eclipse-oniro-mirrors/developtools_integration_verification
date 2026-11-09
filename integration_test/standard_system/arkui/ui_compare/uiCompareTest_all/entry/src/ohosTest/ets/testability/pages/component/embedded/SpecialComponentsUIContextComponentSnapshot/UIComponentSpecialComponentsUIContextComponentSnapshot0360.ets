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
import { UIContext } from '@kit.ArkUI';

@Entry
@Component
struct UIComponentSpecialComponentsUIContextComponentSnapshot0360 {
  @State name: string = 'UIComponentSpecialComponentsUIContextComponentSnapshot0360';
  @State message: string = this.name;
  @State pixmap: image.PixelMap | undefined = undefined;
  uiContext: UIContext = this.getUIContext();

  @Builder
  RandomBuilder() {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.Center,
      alignItems: ItemAlign.Center
    }) {
      Image('/images/image.jpeg')
        .width(110)
        .height(110)
        .margin(15)
        .objectFit(ImageFit.Auto)
        .overlay('GIF Image', {
          align: Alignment.Center,
          offset: {
            x: 0,
            y: 20
          }
        })
    }
    .width('100%')
    .id(this.name + '_01')
  }

  build() {
    Column() {
      Text(this.message)
        .margin(10)

      Image(this.pixmap)
        .width(110)
        .height(110)
        .margin(5)
        .objectFit(ImageFit.Auto)
        .overlay('Snapshot', {
          align: Alignment.Center,
          offset: {
            x: 0,
            y: 20
          }
        })
        .border({
          color: Color.Black,
          width: 2
        })

      Button('click to generate UI snapshot')
        .onClick(() => {
          this.uiContext.getComponentSnapshot().createFromBuilder(() => {
            this.RandomBuilder()
          },
            (error: Error, pixmap: image.PixelMap) => {
              if (error) {
                console.error('generate UI snapshot error: ' + JSON.stringify(error));
                this.message += '\nerror: ' + JSON.stringify(error);
                return;
              }
              console.info('generate UI snapshot succeed.');
              this.message += '\ngenerate UI snapshot succeed.';
              this.pixmap = pixmap;
            }, 320, true, {
              scale: 2,
              waitUntilRenderFinished: true
            });
        })
        .id(this.name + '_02')
        .margin(10)

    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}
