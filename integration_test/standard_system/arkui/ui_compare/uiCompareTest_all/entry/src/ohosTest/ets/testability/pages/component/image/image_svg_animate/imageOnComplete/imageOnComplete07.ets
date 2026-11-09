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
struct ImageOnComplete07 {
  @State info:string = 'loading~~';
  @State img:ResourceStr = $r('app.media.icon');
  @State loadingStatus:number = 1;
  @State contentWidth:number = 1;
  @State contentHeight:number = 1;
  @State contentOffsetX:number = 1;
  @State contentOffsetY:number = 1;
  @State imageFit:ImageFit = ImageFit.Contain;
  @State onCompleteNum:number = 0;

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        Text('image test objectFit')
          .height(40)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)

        Text('objectFit ：' + this.imageFit + ' onComplete：' + this.onCompleteNum)
          .height(40)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)

        Text('loadingStatus :' + this.loadingStatus)
          .height(30)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(6)

        Text('contentWidth :' + this.contentWidth)
          .height(30)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(6)

        Text('contentHeight :' + this.contentHeight)
          .height(30)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(6)

        Text('contentOffsetX :' + this.contentOffsetX)
          .height(30)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(6)

        Text('contentOffsetY :' + this.contentOffsetY)
          .height(30)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(6)

        Row(){
          Button('ImageFit.Fill')
            .id('imageOnComplete07_01')
            .height(40)
            .backgroundColor(Color.White)
            .fontSize(14)
            .fontColor(Color.Black)
            .width('45%')
            .border({ width: 1 })
            .fontWeight(400)
            .margin(10)
            .onClick(() => {
              this.imageFit = ImageFit.Fill
            })

          Button('ImageFit.Contain')
            .id('imageOnComplete07_02')
            .height(40)
            .backgroundColor(Color.White)
            .fontSize(14)
            .fontColor(Color.Black)
            .width('45%')
            .border({ width: 1 })
            .fontWeight(400)
            .margin(10)
            .onClick(() => {
              this.imageFit = ImageFit.Contain
            })
        }.width('100%')

        Image(this.img)
          .width(200)
          .height(200)
          .borderRadius(20)
          .margin(15)
          .objectFit(this.imageFit)
          .onComplete((event)=>{
            if(event) {
              this.onCompleteNum++
              this.info = 'loading success'
              console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
              console.log('onComplete:event.contentWidth ' + event.contentWidth)
              console.log('onComplete:event.contentHeight ' + event.contentHeight)
              console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
              console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
              this.loadingStatus = event.loadingStatus
              this.contentWidth = event.contentWidth
              this.contentHeight = event.contentHeight
              this.contentOffsetX = event.contentOffsetX
              this.contentOffsetY = event.contentOffsetY
            }
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
    .width('90%')
  }
}
