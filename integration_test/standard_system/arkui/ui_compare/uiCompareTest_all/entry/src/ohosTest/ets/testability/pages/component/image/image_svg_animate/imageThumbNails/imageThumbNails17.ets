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

import { matrix4 } from '@kit.ArkUI';

@Entry
@Component
struct ImageThumbNails17 {
  @State info1: string = 'loading~~';
  @State info2: string = 'loading~~';
  @State info3: string = 'loading~~';
  @State info4: string = 'loading~~';
  @State info5: string = 'loading~~';
  private matrix = matrix4.identity()
    .translate({ x: 80, y: 120 })
    .rotate({
      x: 2,
      y: 0.5,
      z: 3,
      centerX: 10,
      centerY: 10,
      angle: 60
    })

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
  @State imageSrcIndex4: number = 0;
  @State imageSrcIndex5: number = 0;

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {

        Text('image test different rotate、translate、scale and change')
          .height(48)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(5)

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

          Image(this.imageSrcList1[this.imageSrcIndex1])
            .width(110)
            .height(110)
            .margin(20)
            .padding(5)
            .objectFit(ImageFit.Contain)
            .backgroundColor(Color.White)
            .imageMatrix(this.matrix)
            .autoResize(true)
            .borderRadius(20)
            .onComplete((event) => {
              if (event) {
                console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
                console.log('onComplete:event.contentWidth ' + event.contentWidth)
                console.log('onComplete:event.contentHeight ' + event.contentHeight)
                console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
                console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
                this.info1 = 'loading success';
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
        .height('19%')

        Row(){
          Column(){
            Text('jpg')
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

          Image(this.imageSrcList2[this.imageSrcIndex2])
            .width(110)
            .height(110)
            .margin(20)
            .padding(5)
            .objectFit(ImageFit.Contain)
            .backgroundColor(Color.White)
            .imageMatrix(this.matrix)
            .autoResize(true)
            .borderRadius(20)
            .onComplete((event) => {
              if (event) {
                console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
                console.log('onComplete:event.contentWidth ' + event.contentWidth)
                console.log('onComplete:event.contentHeight ' + event.contentHeight)
                console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
                console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
                this.info2 = 'loading success';
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
        .height('19%')

        Row(){
          Column(){
            Text('bmp')
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

          Image(this.imageSrcList3[this.imageSrcIndex3])
            .width(110)
            .height(140)
            .margin(20)
            .padding(5)
            .objectFit(ImageFit.Contain)
            .backgroundColor(Color.White)
            .imageMatrix(this.matrix)
            .autoResize(true)
            .borderRadius(20)
            .onComplete((event) => {
              if (event) {
                console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
                console.log('onComplete:event.contentWidth ' + event.contentWidth)
                console.log('onComplete:event.contentHeight ' + event.contentHeight)
                console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
                console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
                this.info3 = 'loading success';
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
        .height('19%')

        Row(){
          Column(){
            Text('jpeg')
              .height(40)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width(170)
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin({top:20,bottom:6})

            Text(this.info4)
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

          Image(this.imageSrcList4[this.imageSrcIndex4])
            .width(110)
            .height(140)
            .margin(20)
            .padding(5)
            .objectFit(ImageFit.Contain)
            .backgroundColor(Color.White)
            .imageMatrix(this.matrix)
            .autoResize(true)
            .borderRadius(20)
            .onComplete((event) => {
              if (event) {
                console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
                console.log('onComplete:event.contentWidth ' + event.contentWidth)
                console.log('onComplete:event.contentHeight ' + event.contentHeight)
                console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
                console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
                this.info4 = 'loading success';
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
        .height('19%')

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

            Text(this.info5)
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

          Image(this.imageSrcList5[this.imageSrcIndex5])
            .width(110)
            .height(120)
            .margin(20)
            .padding(5)
            .objectFit(ImageFit.Contain)
            .backgroundColor(Color.White)
            .imageMatrix(this.matrix)
            .autoResize(true)
            .borderRadius(20)
            .onComplete((event) => {
              if (event) {
                console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
                console.log('onComplete:event.contentWidth ' + event.contentWidth)
                console.log('onComplete:event.contentHeight ' + event.contentHeight)
                console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
                console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
                this.info5 = 'loading success';
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
        .height('19%')
      }
    }.height('100%')
    .width('100%')
    .padding({ right: 10, top: 10 })
  }
}
