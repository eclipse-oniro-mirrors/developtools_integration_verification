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
struct ImageOutliers18 {
  @State info1:string = 'loading~~';
  @State info2:string = 'loading~~';
  @State testArg1:number | undefined | null  = undefined;
  @State testArg2:number | undefined | null = null;

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        Text('image test privacySensitive')
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
          Text('privacySensitive: ' + this.testArg1)
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
            .width(120)
            .height(120)
            .borderRadius(20)
            .margin(15)
            .privacySensitive(undefined)
            .onComplete((event)=>{
              if(event) {
                this.info1 = 'loading success'
              }
            })
        }
        .width('70%')
        .height('40%')
        .margin({right:20})

        Column(){
          Text('privacySensitive: ' + this.testArg2)
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
            .width(120)
            .height(120)
            .borderRadius(20)
            .margin(15)
            .privacySensitive(null)
            .onComplete((event)=>{
              if(event) {
                this.info2 = 'loading success'
              }
            })
        }
        .width('70%')
        .height('40%')

      }.width('100%')
      .height('100%')
    }
    .height('100%')
    .width('98%')
  }
}
