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
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct UiComponentImageAttachmentColorFilter13 {
  @State message: string = 'SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0050';
  imagePixelMap: image.PixelMap | undefined = undefined;
  mutableStr: MutableStyledString = new MutableStyledString('测试文本');
  mutableStr2: MutableStyledString = new MutableStyledString('测试文本');
  controller: TextController = new TextController();
  controller2: TextController = new TextController();
  private uiContext: UIContext = this.getUIContext();

  async aboutToAppear() {
    this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.app_icon'));
  }

  private async getPixmapFromMedia(resource: Resource) {
    try {
      let unit8Array = await this.uiContext.getHostContext()?.resourceManager?.getMediaContent({
        bundleName: resource.bundleName,
        moduleName: resource.moduleName,
        id: resource.id
      });
      if (unit8Array) {
        let imageSource = image.createImageSource(unit8Array.buffer.slice(0, unit8Array.buffer.byteLength));
        let createPixelMap: image.PixelMap = await imageSource.createPixelMap({
          desiredPixelFormat: image.PixelMapFormat.RGBA_8888
        });
        await imageSource.release();
        return createPixelMap;
      }
    } catch (error) {
      console.error('Error loading image:', error);
    }
    return undefined;
  }

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(this.message)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .width('90%')
          .textAlign(TextAlign.Center)
          .margin({ top: 10 })

        Divider()
          .width('90%')
          .color(Color.Gray)

        Text('显示区域1 (不设置colorFilter)')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .width('90%')

        Text(undefined, { controller: this.controller })
          .copyOption(CopyOptions.InApp)
          .fontSize(20)
          .width('90%')
          .height(80)
          .border({ width: 1, color: Color.Blue })
          .padding(10)
          .margin(10)
          .backgroundColor('#F5F5F5')

        Button('设置图片-不设置colorFilter')
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 2,
            minFontSize: 10,
            maxFontSize: 20,
            font: {
              size: 20,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .fontSize(14)
          .width('80%')
          .backgroundColor('#007DFF')
          .onClick(() => {
            if (this.imagePixelMap !== undefined) {
              this.mutableStr = new MutableStyledString(new ImageAttachment({
                value: this.imagePixelMap,
                size: { width: 50, height: 50 },
                layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                verticalAlign: ImageSpanAlignment.BASELINE,
                objectFit: ImageFit.Fill
              }));
              this.controller.setStyledString(this.mutableStr);
            }
          })
          .id('UiComponentImageAttachmentColorFilter13_01')

        Divider()
          .width('90%')
          .color(Color.Gray)
          .margin({ top: 10 })

        Text('显示区域2 (colorFilter=undefined)')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .width('90%')

        Text(undefined, { controller: this.controller2 })
          .copyOption(CopyOptions.InApp)
          .fontSize(20)
          .width('90%')
          .height(80)
          .border({ width: 1, color: Color.Blue })
          .padding(10)
          .margin(10)
          .backgroundColor('#F5F5F5')

        Button('设置图片-colorFilter undefined')
          .fontSize(14)
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 2,
            minFontSize: 10,
            maxFontSize: 20,
            font: {
              size: 20,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .width('80%')
          .backgroundColor('#007DFF')
          .onClick(() => {
            if (this.imagePixelMap !== undefined) {
              this.mutableStr2 = new MutableStyledString(new ImageAttachment({
                value: this.imagePixelMap,
                size: { width: 50, height: 50 },
                layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                verticalAlign: ImageSpanAlignment.BASELINE,
                objectFit: ImageFit.Fill,
                colorFilter: undefined
              }));
              this.controller2.setStyledString(this.mutableStr2);
            }
          })
          .id('UiComponentImageAttachmentColorFilter13_02')

        Divider()
          .width('90%')
          .color(Color.Gray)
          .margin({ top: 10 })

        Text('测试预期')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .width('90%')

        Text('✓ 两种方式图片显示一致')
          .fontSize(12)
          .fontColor(Color.Green)
          .width('90%')

        Text('✓ 无过滤色效果')
          .fontSize(12)
          .fontColor(Color.Green)
          .width('90%')

        Text('✓ 与image组件表现一致')
          .fontSize(12)
          .fontColor(Color.Green)
          .width('90%')

        Text('✓ 图片原色显示')
          .fontSize(12)
          .fontColor(Color.Green)
          .width('90%')
          .margin({ bottom: 20 })
      }
      .width('100%')
      .padding({ left: 10, right: 10 })
    }
    .width('100%')
    .height('100%')
  }
}

