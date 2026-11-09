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
struct UiComponentImageAttachmentColorFilter21 {
  @State message: string = 'SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0220';
  imagePixelMap: image.PixelMap | undefined = undefined;
  mutableStr: MutableStyledString = new MutableStyledString('');
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  private uiContext: UIContext = this.getUIContext();
  @State contentInfo: string = '';
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

          Text('富文本RichEditor设置属性字符串ImageAttachment')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')

          Text('验证colorFilter在富文本中的显示效果')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E3F2FD')
        .borderRadius(8)

        Column({ space: 5 }) {
          Text('富文本显示区域')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')

          RichEditor({ controller: this.controller })
            .width('100%')
            .height(70)
            .border({ width: 1, color: '#CCCCCC' })
            .backgroundColor('#FFFFFF')
            .borderRadius(8)
            .id('UiComponentImageAttachmentColorFilter21_richeditor')
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

          Button('1. 设置富文本-添加图片和colorFilter')
            .fontSize(14)
            .width('100%')
            .height(45)
            .backgroundColor('#2196F3')
            .onClick(() => {
              try {
                if (this.imagePixelMap !== undefined) {
                  this.mutableStr = new MutableStyledString('富文本测试: ');
                  this.mutableStr.appendStyledString(new MutableStyledString(new ImageAttachment({
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
                  })));
                  this.mutableStr.appendStyledString(new MutableStyledString(' 图片显示效果'));
                  this.controller.setStyledString(this.mutableStr);
                  this.contentInfo = '富文本内容已设置';
                } else {
                  this.contentInfo = '图片加载失败';
                }
              } catch (error) {
                this.contentInfo = `设置失败: ${error}`;
                console.error('setStyledString error:', error);
              }
            })
            .id('UiComponentImageAttachmentColorFilter21_01')

          Button('2. 获取富文本内容')
            .fontSize(14)
            .width('100%')
            .height(45)
            .backgroundColor('#FF9800')
            .onClick(() => {
              try {
                let styledString = this.controller.getStyledString();
                this.contentInfo = `内容长度: ${styledString.length}`;

                // 获取图片样式信息
                let imageArray = styledString.getStyles(0, styledString.length, StyledStringKey.IMAGE);
                console.info('富文本图片数量: ' + imageArray.length);

                for (let i = 0; i < imageArray.length; ++i) {
                  if (imageArray[i].styledKey === StyledStringKey.IMAGE) {
                    let attachment = imageArray[i].styledValue as ImageAttachment;
                    console.info('富文本 colorFilter: ' + attachment.colorFilter);

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
              } catch (error) {
                this.contentInfo = `获取失败: ${error}`;
                this.colorFilterInfo = '';
                console.error('getStyledString error:', error);
              }
            })
            .id('UiComponentImageAttachmentColorFilter21_02')

          Button('3. 清空富文本内容')
            .fontSize(14)
            .width('100%')
            .height(45)
            .backgroundColor('#F44336')
            .onClick(() => {
              try {
                this.controller.setStyledString(new MutableStyledString(''));
                this.contentInfo = '内容已清空';
                this.colorFilterInfo = '';
              } catch (error) {
                this.contentInfo = `清空失败: ${error}`;
                console.error('clear error:', error);
              }
            })
            .id('UiComponentImageAttachmentColorFilter21_03')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#F3E5F5')
        .borderRadius(8)

        Column({ space: 5 }) {
          Text('内容信息')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#607d7B')
            .width('100%')

          Text(this.contentInfo)
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

          Text('1. 点击第一个按钮,富文本显示图片和文字')
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')

          Text('2. 图片应用colorFilter过滤效果')
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')

          Text('3. 点击获取按钮,显示完整的colorFilter矩阵')
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')

          Text('4. 富文本内正常显示,与Text组件表现一致')
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')

          Text('5. 点击清空按钮,富文本内容被清空')
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFF3E0')
        .borderRadius(8)
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
