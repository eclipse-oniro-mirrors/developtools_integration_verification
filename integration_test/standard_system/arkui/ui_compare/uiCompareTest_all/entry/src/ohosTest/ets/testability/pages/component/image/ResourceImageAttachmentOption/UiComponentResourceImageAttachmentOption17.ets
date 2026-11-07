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
struct UiComponentResourceImageAttachmentOption17{
  @State message: string = '';
  imagePixelMap: image.PixelMap | undefined = undefined;
  @State imagePixelMap3: image.PixelMap | undefined = undefined;
  @State mysize : string = ''
  @State myverticalAlign : string = ''
  @State mycolorFilter : string = ''
  @State myobjectFit : string = ''
  mutableStr: MutableStyledString = new MutableStyledString('123');
  controller: TextController = new TextController();
  controller2: TextController = new TextController();
  private uiContext: UIContext = this.getUIContext();
  mutableStr2: MutableStyledString = new MutableStyledString('This is set decoration line style to the mutableStr2', [{
    start: 0,
    length: 15,
    styledKey: StyledStringKey.DECORATION,
    styledValue: new DecorationStyle({
      type: TextDecorationType.Overline,
      color: Color.Orange,
      style: TextDecorationStyle.DOUBLE
    })
  }]);

  async aboutToAppear() {
    console.info('aboutToAppear initial imagePixelMap');
    this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.app_icon'));
  }

  private async getPixmapFromMedia(resource: Resource) {
    let unit8Array = await this.uiContext.getHostContext()?.resourceManager?.getMediaContent({
      bundleName: resource.bundleName,
      moduleName: resource.moduleName,
      id: resource.id
    });
    let imageSource = image.createImageSource(unit8Array?.buffer.slice(0, unit8Array.buffer.byteLength));
    let createPixelMap: image.PixelMap = await imageSource.createPixelMap({
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888
    });
    await imageSource.release();
    return createPixelMap;
  }

  build() {
    Row() {
      Column({ space: 5 }) {
        Text(undefined, { controller: this.controller })
          .copyOption(CopyOptions.InApp)
          .draggable(true)
          .fontSize(30)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .margin(30)
          .padding(10)
        Button('set layoutStyle to insert a new image')
          .fontSize(10)
          .height(100)
          .backgroundColor(0x317aff)
          .onClick(() => {
            if (this.imagePixelMap !== undefined) {
              this.mutableStr = new MutableStyledString(new ImageAttachment({
                value: this.imagePixelMap,
                size: { width: 50, height: 50 },
                verticalAlign: ImageSpanAlignment.CENTER,
                objectFit: ImageFit.Fill,
                colorFilter:[
                  0.50, 0.09, 0.62, 0.58, 0.39,
                  0.31, 0.54, 0.21, 0.22, 0.09,
                  0.10, 0.40, 0.90, 0.11, 0.43,
                  0.11, 0.05, 0.08, 1.00, 0.12
                ]
              }));
              this.controller.setStyledString(this.mutableStr);
            }
          })
          .id('UiComponentResourceImageAttachmentOption17_01')
        Button('Image之Get')
          .onClick(() => {
            if (this.mutableStr.length === 0) {
              this.message='图片已被removeString 无法获取'
              console.info('当前文本中没有图片');
              return;
            }
            let imageArray = this.mutableStr.getStyles(0, this.mutableStr.length, StyledStringKey.IMAGE);
            for (let i = 0; i < imageArray.length; ++i) {
              console.info('mutableStr start ' + imageArray[i].start + ' length ' + imageArray[i].length + ' type ' +
              imageArray[i].styledKey);
              if (imageArray[i].styledKey === 300) {
                let attachment = imageArray[i].styledValue as ImageAttachment;
                this.imagePixelMap3 = attachment.value;
                console.info('mutableStr value ' + JSON.stringify(attachment.value));
                if (attachment.size !== undefined) {
                  console.info('mutableStr size width ' + attachment.size.width + ' height ' + attachment.size.height);
                }
                this.mysize=JSON.stringify(attachment.size)
                this.myverticalAlign=JSON.stringify(attachment.verticalAlign)
                this.mycolorFilter=JSON.stringify(attachment.colorFilter)
                this.myobjectFit=JSON.stringify(attachment.objectFit)
                console.info('mutableStr vertical ' + attachment.verticalAlign);
                console.info('mutableStr fit ' + attachment.objectFit);
                console.info('mutableStr colorFilter ' + attachment.colorFilter);
                if (attachment.layoutStyle !== undefined) {
                  let radius = attachment.layoutStyle.borderRadius as BorderRadiuses;
                  console.info('mutableStr radius ' + JSON.stringify(radius));
                }
              }
            }
          })
          .id('UiComponentResourceImageAttachmentOption17_02')
        Button('Image之insertString')
          .onClick(() => {
            if (this.imagePixelMap !== undefined) {
              this.mutableStr2 = new MutableStyledString(new ImageAttachment({
                value: this.imagePixelMap,
                size: { width: 50, height: 50 },
                layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                verticalAlign: ImageSpanAlignment.BASELINE,
                objectFit:ImageFit.Contain,
                colorFilter:[
                  1, 0, 0, 0, 0,
                  0, 1, 0, 0, 0,
                  0, 0, 1, 0, 0,
                  0, 0, 0, 1, 0
                ]
              }));
            }
            this.mutableStr.insertString(1,'123');
            this.controller.setStyledString(this.mutableStr);
          })
          .id('UiComponentResourceImageAttachmentOption17_03')
        Text('size='+this.mysize+' verticalAlign'+this.myverticalAlign+' colorFilter'+this.mycolorFilter+' objectFit'+this.myobjectFit)
          .lineHeight(20)
          .margin(30)
          .padding(10)
          .fontColor(Color.Red)
          .fontSize(10)
      }
      .width('100%')
    }
    .height('100%')
  }
}