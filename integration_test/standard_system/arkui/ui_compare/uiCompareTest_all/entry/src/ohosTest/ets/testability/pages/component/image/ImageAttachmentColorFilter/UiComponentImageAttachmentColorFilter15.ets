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
struct UiComponentImageAttachmentColorFilter15 {
  @State message: string = 'SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0130';
  imagePixelMap: image.PixelMap | undefined = undefined;
  mutableStr: MutableStyledString = new MutableStyledString('测试文本');
  controller: TextController = new TextController();
  private uiContext: UIContext = this.getUIContext();
  @State styleInfo: string = '';
  @State colorFilterInfo: string = '';

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
    Row() {
      Column({ space: 10 }) {
        Text(this.message)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .width('90%')
          .textAlign(TextAlign.Center)

        Text('测试replaceStyle替换图片样式')
          .fontSize(14)
          .width('90%')

        Column({ space: 5 }) {
          Text('图片显示区域')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')

          Text(undefined, { controller: this.controller })
            .copyOption(CopyOptions.InApp)
            .fontSize(20)
            .width('100%')
            .border({ width: 1, color: '#CCCCCC' })
            .padding(15)
            .backgroundColor('#FFFFFF')
            .borderRadius(8)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E8F5E9')
        .borderRadius(8)

        Button('设置图片-colorFilter')
          .fontSize(14)
          .width('80%')
          .onClick(() => {
            if (this.imagePixelMap !== undefined) {
              this.mutableStr = new MutableStyledString(new ImageAttachment({
                value: this.imagePixelMap,
                size: { width: 50, height: 50 },
                layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                verticalAlign: ImageSpanAlignment.BASELINE,
                objectFit: ImageFit.Fill,
                colorFilter: [
                  0.50, 0.09, 0.62, 0.58, 0.39,
                  0.31, 0.54, 0.21, 0.22, 0.09,
                  0.10, 0.40, 0.90, 0.11, 0.43,
                  0.11, 0.05, 0.08, 1.00, 0.12
                ]
              }));
              this.controller.setStyledString(this.mutableStr);
            }
          })
          .id('UiComponentImageAttachmentColorFilter15_01')

        Button('replaceStyle替换colorFilter')
          .fontSize(14)
          .width('80%')
          .onClick(() => {
            if (this.imagePixelMap !== undefined) {
              this.mutableStr.replaceStyle({
                start: 0,
                length: 1,
                styledKey: StyledStringKey.IMAGE,
                styledValue: new ImageAttachment({
                  value: this.imagePixelMap,
                  size: { width: 50, height: 50 },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                  verticalAlign: ImageSpanAlignment.BASELINE,
                  objectFit: ImageFit.Fill,
                  colorFilter: [
                    1.00, 0.00, 0.00, 0.00, 0.00,
                    0.00, 1.00, 0.00, 0.00, 0.00,
                    0.00, 0.00, 1.00, 0.00, 0.00,
                    0.00, 0.00, 0.00, 1.00, 0.00
                  ]
                })
              });
              this.controller.setStyledString(this.mutableStr);
            }
          })
          .id('UiComponentImageAttachmentColorFilter15_02')

        Button('getStyles获取样式')
          .fontSize(14)
          .width('80%')
          .onClick(() => {
            try {
              if (this.mutableStr && this.mutableStr.length > 0) {
                let imageArray = this.mutableStr.getStyles(0, this.mutableStr.length, StyledStringKey.IMAGE);
                this.styleInfo = `样式数量: ${imageArray.length}`;

                for (let i = 0; i < imageArray.length; ++i) {
                  if (imageArray[i].styledKey === StyledStringKey.IMAGE) {
                    let attachment = imageArray[i].styledValue as ImageAttachment;
                    console.info('mutableStr colorFilter ' + attachment.colorFilter);
                    if (attachment.colorFilter) {
                      let filterArray: number[] = [];
                      if (Array.isArray(attachment.colorFilter)) {
                        filterArray = attachment.colorFilter as number[];
                      } else {
                        let filter = attachment.colorFilter as ArrayLike<number>;
                        filterArray = Array.from<number, number>(filter, (item: number) => item);
                      }
                      this.colorFilterInfo = `colorFilter: [${filterArray.join(', ')}]`;
                    } else {
                      this.colorFilterInfo = '无colorFilter';
                    }
                  }
                }
              } else {
                this.styleInfo = '内容为空,无样式信息';
                this.colorFilterInfo = '';
              }
            } catch (error) {
              this.styleInfo = `获取样式失败: ${error}`;
              this.colorFilterInfo = '';
              console.error('getStyles error:', error);
            }
          })
          .id('UiComponentImageAttachmentColorFilter15_03')

        Text(this.styleInfo)
          .fontSize(12)
          .width('90%')
          .border({ width: 1 })
          .padding(5)
          .margin(5)

        if (this.colorFilterInfo) {
          Text(this.colorFilterInfo)
            .fontSize(11)
            .fontColor('#FF5722')
            .width('90%')
            .border({ width: 1, color: '#FFCCBC' })
            .padding(5)
            .margin(5)
            .wordBreak(WordBreak.BREAK_ALL)
        }

        Column({ space: 5 }) {
          Text('测试预期')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF9800')
            .width('100%')

          Text('1. 点击第一个按钮,图片正常显示')
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')

          Text('2. 点击replaceStyle后,过滤色更新')
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')

          Text('3. 获取到的colorfilter为更新后')
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFF3E0')
        .borderRadius(8)
        .margin({ bottom: 20 })
      }
      .width('100%')
    }
    .height('100%')
  }
}

