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
struct UiComponentImageAttachmentColorFilter14 {
  @State message: string = 'SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0120';
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
    Scroll() {
      Column({ space: 8 }) {
        Text(this.message)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .width('90%')
          .textAlign(TextAlign.Center)
          .fontColor('#FF5722')
          .margin({ top: 10 })

        Divider().width('90%').color('#EEEEEE')

        Column({ space: 5 }) {
          Text('测试说明')
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2196F3')
            .width('100%')

          Text('使用removeString方法移除带colorFilter的图片')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')

          Text('验证图片和过滤色是否同步消失')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E3F2FD')
        .borderRadius(8)

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

        Column({ space: 10 }) {
          Text('操作步骤')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#9C27B0')
            .width('100%')

          Button('1. 设置图片-colorFilter')
            .fontSize(14)
            .width('100%')
            .height(45)
            .backgroundColor('#2196F3')
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
            .id('UiComponentImageAttachmentColorFilter14_01')

          Button('2. removeString移除图片')
            .fontSize(14)
            .width('100%')
            .height(45)
            .backgroundColor('#FF9800')
            .onClick(() => {
              try {
                if (this.mutableStr && this.mutableStr.length > 0) {
                  this.mutableStr.removeString(0, this.mutableStr.length);
                  this.controller.setStyledString(this.mutableStr);
                  this.styleInfo = '图片已移除';
                } else {
                  this.styleInfo = '内容已为空,无需移除';
                }
              } catch (error) {
                this.styleInfo = `移除失败: ${error}`;
                console.error('removeString error:', error);
              }
            })
            .id('UiComponentImageAttachmentColorFilter14_02')

          Button('3. getStyles获取样式')
            .fontSize(14)
            .width('100%')
            .height(45)
            .backgroundColor('#4CAF50')
            .onClick(() => {
              try {
                if (this.mutableStr && this.mutableStr.length > 0) {
                  let imageArray = this.mutableStr.getStyles(0, this.mutableStr.length, StyledStringKey.IMAGE);
                  this.styleInfo = `样式数量: ${imageArray.length}`;

                  for (let i = 0; i < imageArray.length; ++i) {
                    console.info('mutableStr start ' + imageArray[i].start + ' length ' + imageArray[i].length +
                      ' type ' + imageArray[i].styledKey);

                    if (imageArray[i].styledKey === StyledStringKey.IMAGE) {
                      let attachment = imageArray[i].styledValue as ImageAttachment;
                      console.info('mutableStr value ' + JSON.stringify(attachment.value));

                      if (attachment.size !== undefined) {
                        console.info('mutableStr size width ' + attachment.size.width + ' height ' + attachment.size.height);
                      }
                      console.info('mutableStr vertical ' + attachment.verticalAlign);
                      console.info('mutableStr fit ' + attachment.objectFit);
                      console.info('mutableStr colorFilter ' + attachment.colorFilter);

                      if (attachment.colorFilter) {
                        let filterArray: number[] = [];
                        if (Array.isArray(attachment.colorFilter)) {
                          filterArray = attachment.colorFilter as number[];
                        } else {
                          // 将colorFilter转换为数组
                          let filter = attachment.colorFilter as ArrayLike<number>;
                          filterArray = Array.from<number, number>(filter, (item: number) => item);
                        }
                        this.colorFilterInfo = `colorFilter: [${filterArray.join(', ')}]`;
                      } else {
                        this.colorFilterInfo = '无colorFilter';
                      }

                      if (attachment.layoutStyle !== undefined) {
                        let radius = attachment.layoutStyle.borderRadius as BorderRadiuses;
                        console.info('mutableStr radius ' + JSON.stringify(radius));
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
            .id('UiComponentImageAttachmentColorFilter14_03')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#F3E5F5')
        .borderRadius(8)

        Column({ space: 5 }) {
          Text('样式信息')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#607d7B')
            .width('100%')

          Text(this.styleInfo)
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')
            .border({ width: 1, color: '#CCCCCC' })
            .padding(10)
            .backgroundColor('#FFFFFF')
            .borderRadius(5)

          if (this.colorFilterInfo) {
            Text(this.colorFilterInfo)
              .fontSize(11)
              .fontColor('#FF5722')
              .width('100%')
              .border({ width: 1, color: '#FFCCBC' })
              .padding(10)
              .backgroundColor('#FFF3E0')
              .borderRadius(5)
              .wordBreak(WordBreak.BREAK_ALL)
              .margin({ top: 5 })
          }
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#ECEFF1')
        .borderRadius(8)

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

          Text('2. 点击removeString后,内容被清空')
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')

          Text('3. 过滤色跟随图片一起消失')
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')

          Text('4. getStyles返回样式数量为0')
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')

          Text('5. 无获取到图片样式信息')
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
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}

