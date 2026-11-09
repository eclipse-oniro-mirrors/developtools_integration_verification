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
struct ImageRotate02 {
  @State info1:string = 'loading~~';
  @State info2:string = 'loading~~';
  @State info3:string = 'loading~~';
  @State info4:string = 'loading~~';
  @State info5:string = 'loading~~';
  @State info6:string = 'loading~~';
  @State info7:string = 'loading~~';
  @State info8:string = 'loading~~';
  @State info9:string = 'loading~~';
  @State info10:string = 'loading~~';
  @State info11:string = 'loading~~';
  @State info12:string = 'loading~~';
  @State info13:string = 'loading~~';
  @State info14:string = 'loading~~';
  @State info15:string = 'loading~~';
  @State testArg1_01:ImageRotateOrientation = ImageRotateOrientation.AUTO
  @State testArg1_02:ImageRotateOrientation = ImageRotateOrientation.UP;
  @State testArg1_03:ImageRotateOrientation = ImageRotateOrientation.RIGHT;
  @State testArg1_04:ImageRotateOrientation = ImageRotateOrientation.DOWN;
  @State testArg1_05:ImageRotateOrientation = ImageRotateOrientation.LEFT;
  @State testArg2_01:ImageRepeat = ImageRepeat.X
  @State testArg2_02:ImageRepeat = ImageRepeat.Y;
  @State testArg2_03:ImageRepeat = ImageRepeat.XY;

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        Text('image test matchTextDirection and orientation')
          .height(25)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)

        Text('matchTextDirection = true')
          .height(25)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)

        Row(){
          Column(){
            Text('orientation： ' + this.testArg2_01)
              .height(40)
              .fontSize(12)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(15)
              .fontWeight(300)
              .margin(3)

            Text(this.info1)
              .height(40)
              .fontSize(12)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(15)
              .fontWeight(300)
              .margin(3)
          }
          .width('42%')
          .height('100%')

          Image($r('app.media.ImageOrientation'))
            .width(100)
            .height(100)
            .borderRadius(20)
            .margin(15)
            .matchTextDirection(true)
            .objectFit(ImageFit.Contain)
            .borderWidth(1)
            .orientation(this.testArg1_01)
            .onComplete((event)=>{
              if(event) {
                this.info1 = 'loading success'
              }
            })
        }
        .width('100%')
        .height('19%')

        Row(){
          Column(){
            Text('orientation： ' + this.testArg2_01)
              .height(40)
              .fontSize(12)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(15)
              .fontWeight(300)
              .margin(3)

            Text(this.info4)
              .height(40)
              .fontSize(12)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(15)
              .fontWeight(300)
              .margin(3)
          }
          .width('42%')
          .height('100%')

          Image($r('app.media.ImageOrientation'))
            .width(100)
            .height(100)
            .borderRadius(20)
            .margin(15)
            .matchTextDirection(true)
            .objectFit(ImageFit.Contain)
            .borderWidth(1)
            .orientation(this.testArg1_02)
            .onComplete((event)=>{
              if(event) {
                this.info4 = 'loading success'
              }
            })
        }
        .width('100%')
        .height('19%')

        Row(){
          Column(){
            Text('orientation： ' + this.testArg2_01)
              .height(40)
              .fontSize(12)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(15)
              .fontWeight(300)
              .margin(3)

            Text(this.info7)
              .height(40)
              .fontSize(12)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(15)
              .fontWeight(300)
              .margin(3)
          }
          .width('42%')
          .height('100%')

          Image($r('app.media.ImageOrientation'))
            .width(100)
            .height(100)
            .borderRadius(20)
            .margin(15)
            .matchTextDirection(true)
            .objectFit(ImageFit.Contain)
            .borderWidth(1)
            .orientation(this.testArg1_03)
            .onComplete((event)=>{
              if(event) {
                this.info7 = 'loading success'
              }
            })
        }
        .width('100%')
        .height('19%')

        Row(){
          Column(){
            Text('orientation： ' + this.testArg2_01)
              .height(40)
              .fontSize(12)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(15)
              .fontWeight(300)
              .margin(3)

            Text(this.info10)
              .height(40)
              .fontSize(12)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(15)
              .fontWeight(300)
              .margin(3)
          }
          .width('42%')
          .height('100%')

          Image($r('app.media.ImageOrientation'))
            .width(100)
            .height(100)
            .borderRadius(20)
            .margin(15)
            .matchTextDirection(true)
            .objectFit(ImageFit.Contain)
            .borderWidth(1)
            .orientation(this.testArg1_04)
            .onComplete((event)=>{
              if(event) {
                this.info10 = 'loading success'
              }
            })
        }
        .width('100%')
        .height('19%')

        Row(){
          Column(){
            Text('orientation： ' + this.testArg2_01)
              .height(40)
              .fontSize(12)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(15)
              .fontWeight(300)
              .margin(3)

            Text(this.info13)
              .height(40)
              .fontSize(12)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(15)
              .fontWeight(300)
              .margin(3)
          }
          .width('42%')
          .height('100%')

          Image($r('app.media.ImageOrientation'))
            .width(100)
            .height(100)
            .borderRadius(20)
            .margin(15)
            .matchTextDirection(true)
            .objectFit(ImageFit.Contain)
            .borderWidth(1)
            .orientation(this.testArg1_05)
            .onComplete((event)=>{
              if(event) {
                this.info13 = 'loading success'
              }
            })
        }
        .width('100%')
        .height('19%')

      }.width('100%')
      .height('100%')
    }
    .height('100%')
    .width('98%')
  }
}
