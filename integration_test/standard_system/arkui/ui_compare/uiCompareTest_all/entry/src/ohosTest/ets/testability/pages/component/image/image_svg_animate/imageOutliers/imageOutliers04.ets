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
struct ImageOutliers04 {
  @State info1:string = 'loading~~';
  @State info2:string = 'loading~~';
  @State info3:string = 'loading~~';
  @State info4:string = 'loading~~';
  @State info5:string = 'loading~~';
  @State info6:string = 'loading~~';
  @State testArg1:number | undefined | null = 1;
  @State testArg2:number | undefined | null = 0;
  @State testArg3:number | undefined | null = -1;
  @State testArg4:number | undefined | null = 100;
  @State testArg5:number | undefined | null = undefined;
  @State testArg6:number | undefined | null = null;

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        Text('image test objectRepeat')
          .height(40)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)

        Row(){
          Column(){
            Text('objectRepeat: ' + this.testArg1)
              .height(30)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)

            Text(this.info1)
              .height(30)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)

            Image(('https://' + 'foruda.gitee.com' + '/images/1753255402677959741/499f5538_10080759.png'))
              .width(80)
              .height(80)
              .borderRadius(20)
              .margin(15)
              .objectRepeat(this.testArg1)
              .onComplete((event)=>{
                if(event) {
                  this.info1 = 'loading success'
                }
              })
          }
          .width('45%')
          .height('100%')
          .margin({right:20})

          Column(){
            Text('objectRepeat: ' + this.testArg2)
              .height(30)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)

            Text(this.info2)
              .height(30)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)

            Image(('https://' + 'foruda.gitee.com' + '/images/1753255402677959741/499f5538_10080759.png'))
              .width(80)
              .height(80)
              .borderRadius(20)
              .margin(15)
              .objectRepeat(this.testArg2)
              .onComplete((event)=>{
                if(event) {
                  this.info2 = 'loading success'
                }
              })
          }
          .width('45%')
          .height('100%')
        }
        .width('100%')
        .height('25%')

        Row(){
          Column(){
            Text('objectRepeat: ' + this.testArg3)
              .height(30)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)

            Text(this.info3)
              .height(30)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)

            Image(('https://' + 'foruda.gitee.com' + '/images/1753255402677959741/499f5538_10080759.png'))
              .width(80)
              .height(80)
              .borderRadius(20)
              .margin(15)
              .objectRepeat(this.testArg3)
              .onComplete((event)=>{
                if(event) {
                  this.info3 = 'loading success'
                }
              })
          }
          .width('45%')
          .height('100%')
          .margin({right:20})

          Column(){
            Text('objectRepeat: ' + this.testArg4)
              .height(30)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)

            Text(this.info4)
              .height(30)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)

            Image(('https://' + 'foruda.gitee.com' + '/images/1753255402677959741/499f5538_10080759.png'))
              .width(80)
              .height(80)
              .borderRadius(20)
              .margin(15)
              .objectRepeat(this.testArg4)
              .onComplete((event)=>{
                if(event) {
                  this.info4 = 'loading success'
                }
              })
          }
          .width('45%')
          .height('100%')
        }
        .width('100%')
        .height('32%')

        Row(){
          Column(){
            Text('objectRepeat: ' + this.testArg5)
              .height(45)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)

            Text(this.info3)
              .height(30)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)

            Image(('https://' + 'foruda.gitee.com' + '/images/1753255402677959741/499f5538_10080759.png'))
              .width(80)
              .height(80)
              .borderRadius(20)
              .margin(15)
              .objectRepeat(this.testArg5)
              .onComplete((event)=>{
                if(event) {
                  this.info3 = 'loading success'
                }
              })
          }
          .width('45%')
          .height('100%')
          .margin({right:20})

          Column(){
            Text('objectRepeat: ' + this.testArg6)
              .height(30)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)

            Text(this.info4)
              .height(30)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('80%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)

            Image(('https://' + 'foruda.gitee.com' + '/images/1753255402677959741/499f5538_10080759.png'))
              .width(80)
              .height(80)
              .borderRadius(20)
              .margin(15)
              .objectRepeat(this.testArg6)
              .onComplete((event)=>{
                if(event) {
                  this.info4 = 'loading success'
                }
              })
          }
          .width('45%')
          .height('100%')
        }
        .width('100%')
        .height('32%')
      }.width('100%')
      .height('100%')
    }
    .height('100%')
    .width('98%')
  }
}
