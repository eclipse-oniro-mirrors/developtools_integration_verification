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

@Entry
@Component
struct ImageRotate04 {
  @State info1: string = 'loading~~';
  @State info2: string = 'loading~~';
  @State info3: string = 'loading~~';
  @State info4: string = 'loading~~';
  @State info5: string = 'loading~~';
  @State isShow: boolean = true;
  @State changeAppear: string = '点我卸载挂载组件';
  private myText: string = 'Text for onAppear';
  @State testArg1_01:ImageRotateOrientation = ImageRotateOrientation.AUTO
  @State testArg1_02:ImageRotateOrientation = ImageRotateOrientation.UP;
  @State testArg1_03:ImageRotateOrientation = ImageRotateOrientation.RIGHT;
  @State testArg1_04:ImageRotateOrientation = ImageRotateOrientation.DOWN;
  @State testArg1_05:ImageRotateOrientation = ImageRotateOrientation.LEFT;

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {

        Text('image test orientation and tree')
          .height(40)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(5)

        Button(this.changeAppear)
          .id('ImageRotate04')
          .height(40)
          .fontSize(15)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .fontWeight(300)
          .margin(10)
          .onClick( () => {
            this.isShow = !this.isShow
          })

        Row(){
          Column(){
            Text('orientation： ' + this.testArg1_01)
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

          Image($r('app.media.ImageOrientation'))
            .width(110)
            .height(110)
            .margin(20)
            .padding(5)
            .objectFit(ImageFit.Contain)
            .backgroundColor(Color.White)
            .orientation(this.testArg1_01)
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
        .height('19%')

        Row(){
          Column(){
            Text('orientation： ' + this.testArg1_02)
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

          Image($r('app.media.ImageOrientation'))
            .width(110)
            .height(110)
            .margin(20)
            .padding(5)
            .objectFit(ImageFit.Contain)
            .backgroundColor(Color.White)
            .orientation(this.testArg1_02)
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
        .height('19%')

        Row(){
          Column(){
            Text('orientation： ' + this.testArg1_03)
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

          Image($r('app.media.ImageOrientation'))
            .width(110)
            .height(140)
            .margin(20)
            .padding(5)
            .objectFit(ImageFit.Contain)
            .backgroundColor(Color.White)
            .orientation(this.testArg1_03)
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
        .height('19%')

        Row(){
          Column(){
            Text('orientation： ' + this.testArg1_04)
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

          Image($r('app.media.ImageOrientation'))
            .width(110)
            .height(140)
            .margin(20)
            .padding(5)
            .objectFit(ImageFit.Contain)
            .backgroundColor(Color.White)
            .orientation(this.testArg1_04)
            .borderRadius(20)
            .onComplete((event) => {
              if (event) {
                console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
                console.log('onComplete:event.contentWidth ' + event.contentWidth)
                console.log('onComplete:event.contentHeight ' + event.contentHeight)
                console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
                console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
                this.info4 = 'loading success'
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
            Text('orientation： ' + this.testArg1_05)
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

          Image($r('app.media.ImageOrientation'))
            .width(110)
            .height(120)
            .margin(20)
            .padding(5)
            .objectFit(ImageFit.Contain)
            .backgroundColor(Color.White)
            .orientation(this.testArg1_05)
            .borderRadius(20)
            .onComplete((event) => {
              if (event) {
                console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
                console.log('onComplete:event.contentWidth ' + event.contentWidth)
                console.log('onComplete:event.contentHeight ' + event.contentHeight)
                console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
                console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
                this.info5 = 'loading success'
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
