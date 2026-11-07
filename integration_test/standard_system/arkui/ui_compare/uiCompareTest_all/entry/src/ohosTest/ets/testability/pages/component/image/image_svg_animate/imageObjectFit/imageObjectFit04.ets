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

@Entry
@Component
struct ImageObjectFit04 {
  @State info1: string = 'loading~~';
  @State info2: string = 'loading~~';
  @State info3: string = 'loading~~';
  @State info4: string = 'loading~~';
  @State info5: string = 'loading~~';
  @State isShow: boolean = true;
  @State changeAppear: string = '点我卸载挂载组件';
  @State imageSrcList1: (ResourceStr | ImageContent)[] = [$r('app.media.icon'), ImageContent.EMPTY];
  @State imageSrcList2: (ResourceStr | ImageContent)[] = [('https://' + 'images.openharmony.cn' + '/330-%E8%BF%90%E8%90%A5%E5%9B%BE/%E5%AD%A6%E9%99%A2/530/application_basic_l.jpg'), ImageContent.EMPTY];
  @State imageSrcList3: (ResourceStr | ImageContent)[] = [('https://' + 'docimg9.docs.qq.com' + '/image/AgAABd3lbMrG1njr_7dKwYs9RKdNxYEz.png?w=114&h=114'), ImageContent.EMPTY];
  @State imageSrcList4: (ResourceStr | ImageContent)[] = [('https://' + 'images.pexels.com' + '/photos/1485894/pexels-photo-1485894.jpeg'), ImageContent.EMPTY];
  @State imageSrcList5: (ResourceStr | ImageContent)[] = [('https://' + 'www.runoob.com' + '/try/demo_source/smiley-2.gif'), ImageContent.EMPTY];
  @State imageSrcIndex1: number = 0;
  @State imageSrcIndex2: number = 0;
  @State imageSrcIndex3: number = 0;
  @State imagePixelMap1: image.PixelMap | undefined = undefined;
  @State imagePixelMap2: image.PixelMap | undefined = undefined;
  @State imagePixelMap3: image.PixelMap | undefined = undefined;
  @State objectFit:ImageFit = ImageFit.TOP_START

  private async getPixmapFromMedia(resource: Resource) {
    let unit8Array = await getContext(this)?.resourceManager?.getMediaContent({
      bundleName: resource.bundleName,
      moduleName: resource.moduleName,
      id: resource.id
    })
    let imageSource = image.createImageSource(unit8Array.buffer.slice(0, unit8Array.buffer.byteLength))
    let createPixelMap: image.PixelMap = await imageSource.createPixelMap({
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888
    })
    await imageSource.release()
    return createPixelMap
  }

  async aboutToAppear() {
    this.imagePixelMap1 = await this.getPixmapFromMedia($r('app.media.icon'))
    this.imagePixelMap2 = await this.getPixmapFromMedia($r('app.media.icon3'))
    this.imagePixelMap3 = await this.getPixmapFromMedia($r('app.media.imageLabel01'))
  }

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {

        Text('image test objectFit in PixelMap')
          .height(48)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(5)

        Button('ImageFit.TOP')
          .id('imageObjectFit04_01')
          .height('1%')
          .fontSize(15)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .fontWeight(300)
          .margin(10)
          .onClick(() => {
            this.objectFit = ImageFit.TOP
          })

        Button('ImageFit.TOP_END')
          .id('imageObjectFit04_02')
          .height('1%')
          .fontSize(15)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .fontWeight(300)
          .margin(10)
          .onClick(() => {
            this.objectFit = ImageFit.TOP_END
          })

        Button('ImageFit.START')
          .id('imageObjectFit04_03')
          .height('1%')
          .fontSize(15)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .fontWeight(300)
          .margin(10)
          .onClick(() => {
            this.objectFit = ImageFit.START
          })

        Button('ImageFit.CENTER')
          .id('imageObjectFit04_04')
          .height('1%')
          .fontSize(15)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .fontWeight(300)
          .margin(10)
          .onClick(() => {
            this.objectFit = ImageFit.CENTER
          })

        Button('ImageFit.END')
          .id('imageObjectFit04_05')
          .height('1%')
          .fontSize(15)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .fontWeight(300)
          .margin(10)
          .onClick(() => {
            this.objectFit = ImageFit.END
          })

        Button('ImageFit.BOTTOM_START')
          .id('imageObjectFit04_06')
          .height('1%')
          .fontSize(15)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .fontWeight(300)
          .margin(10)
          .onClick(() => {
            this.objectFit = ImageFit.BOTTOM_START
          })

        Button('ImageFit.BOTTOM')
          .id('imageObjectFit04_07')
          .height('1%')
          .fontSize(15)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .fontWeight(300)
          .margin(10)
          .onClick(() => {
            this.objectFit = ImageFit.BOTTOM
          })

        Button('ImageFit.BOTTOM_END')
          .id('imageObjectFit04_08')
          .height('1%')
          .fontSize(15)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .fontWeight(300)
          .margin(10)
          .onClick(() => {
            this.objectFit = ImageFit.BOTTOM_END
          })

        Row(){
          Column(){
            Text('png')
              .height(40)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width(170)
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin({top:20,bottom:6})

            Text(this.info1)
              .height(40)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width(170)
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)
          }

          Image(this.imagePixelMap1)
            .width(80)
            .height(130)
            .margin(20)
            .padding(5)
            .objectFit(this.objectFit)
            .backgroundColor(Color.White)
            .orientation(ImageRotateOrientation.AUTO)
            .borderRadius(20)
            .onComplete((event) => {
              if (event) {
                console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
                console.log('onComplete:event.contentWidth ' + event.contentWidth)
                console.log('onComplete:event.contentHeight ' + event.contentHeight)
                console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
                console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
                this.info1 = 'loading success'
              }
            })
            .onAttach(() => {
              this.getUIContext().getPromptAction().showToast({
                message: 'The text is shown',
                duration: 2000,
                bottom: 500
              })
            })
            .onDetach(() => {
              this.getUIContext().getPromptAction().showToast({
                message: 'The text is hidden',
                duration: 2000,
                bottom: 500
              })
            })

        }.width('100%')
        .height('25%')

        Row(){
          Column(){
            Text('gif')
              .height(40)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width(170)
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin({top:20,bottom:6})

            Text(this.info2)
              .height(40)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width(170)
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)
          }

          Image(this.imagePixelMap2)
            .width(80)
            .height(130)
            .margin(20)
            .padding(5)
            .objectFit(this.objectFit)
            .backgroundColor(Color.White)
            .orientation(ImageRotateOrientation.AUTO)
            .borderRadius(20)
            .onComplete((event) => {
              if (event) {
                console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
                console.log('onComplete:event.contentWidth ' + event.contentWidth)
                console.log('onComplete:event.contentHeight ' + event.contentHeight)
                console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
                console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
                this.info1 = 'loading success'
              }
            })
            .onAttach(() => {
              this.getUIContext().getPromptAction().showToast({
                message: 'The text is shown',
                duration: 2000,
                bottom: 500
              })
            })
            .onDetach(() => {
              this.getUIContext().getPromptAction().showToast({
                message: 'The text is hidden',
                duration: 2000,
                bottom: 500
              })
            })

        }.width('100%')
        .height('25%')

        Row(){
          Column(){
            Text('svg')
              .height(40)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width(170)
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin({top:20,bottom:6})

            Text(this.info3)
              .height(40)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width(170)
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)
          }

          Image(this.imagePixelMap3)
            .width(80)
            .height(130)
            .margin(20)
            .padding(5)
            .objectFit(this.objectFit)
            .backgroundColor(Color.White)
            .orientation(ImageRotateOrientation.AUTO)
            .borderRadius(20)
            .onComplete((event) => {
              if (event) {
                console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
                console.log('onComplete:event.contentWidth ' + event.contentWidth)
                console.log('onComplete:event.contentHeight ' + event.contentHeight)
                console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
                console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
                this.info3 = 'loading success'
              }
            })
            .onAttach(() => {
              this.getUIContext().getPromptAction().showToast({
                message: 'The text is shown',
                duration: 2000,
                bottom: 500
              })
            })
            .onDetach(() => {
              this.getUIContext().getPromptAction().showToast({
                message: 'The text is hidden',
                duration: 2000,
                bottom: 500
              })
            })

        }.width('100%')
        .height('25%')
      }
    }.height('100%')
    .width('100%')
    .padding({ right: 10, top: 10 })
  }
}
