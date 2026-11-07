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
struct ImageOutliers02 {
  @State info1:string = 'loading~~';
  @State info2:string = 'loading~~';
  @State info3:string = 'loading~~';
  @State info4:string = 'loading~~';
  @State info5:string = 'loading~~';
  @State info6:string = 'loading~~';
  @State testArg1:string | Resource | PixelMap = '1';
  @State testArg2:number | undefined | null | string = 0;
  @State testArg3:number | undefined | null | string = -1;
  @State testArg4:number | undefined | null | string = 100;
  @State testArg5:number | undefined | null = undefined;
  @State testArg6:number | undefined | null = null;
  @State testArg7:number | undefined | null | string = '空字符串';

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        Text('image test alt')
          .height(40)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)

        Column(){
          Text('alt: ' + this.testArg5)
            .height(45)
            .fontSize(15)
            .textAlign(TextAlign.Center)
            .fontColor(Color.Black)
            .width('80%')
            .border({ width: 1 })
            .lineHeight(20)
            .fontWeight(300)
            .margin(6)

          Text(this.info5)
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
            .alt(undefined)
            .onComplete((event)=>{
              if(event) {
                this.info5 = 'loading success'
              }
            })
        }
        .width('70%')
        .height('30%')

        Column(){
          Text('alt: ' + this.testArg6)
            .height(30)
            .fontSize(15)
            .textAlign(TextAlign.Center)
            .fontColor(Color.Black)
            .width('80%')
            .border({ width: 1 })
            .lineHeight(20)
            .fontWeight(300)
            .margin(6)

          Text(this.info6)
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
            .alt(null)
            .onComplete((event)=>{
              if(event) {
                this.info6 = 'loading success'
              }
            })
        }
        .width('70%')
        .height('30%')

        Column(){
          Text('alt: ' + this.testArg7)
            .height(30)
            .fontSize(15)
            .textAlign(TextAlign.Center)
            .fontColor(Color.Black)
            .width('80%')
            .border({ width: 1 })
            .lineHeight(20)
            .fontWeight(300)
            .margin(6)

          Text(this.info6)
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
            .alt('')
            .onComplete((event)=>{
              if(event) {
                this.info6 = 'loading success'
              }
            })
        }
        .width('70%')
        .height('30%')
      }.width('100%')
      .height('100%')
    }
    .height('100%')
    .width('98%')
  }
}
