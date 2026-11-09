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
struct ImageOpacity06 {
  @State info:string = 'loading~~';
  @State img:ResourceStr = ('https://' + 'foruda.gitee.com' + '/images/1753255402677959741/499f5538_10080759.png');
  @State loadingStatus:number = 1;

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        Text('image test opacity')
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

        Image(this.img)
          .width(150)
          .height(200)
          .borderRadius(20)
          .margin(15)
          .opacity(0.1)
          .onComplete((event)=>{
            if(event) {
              this.info = 'loading success'
              console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
              this.loadingStatus = event.loadingStatus
            }
          })
      }.width('100%')
      .height('100%')
    }
    .height('100%')
    .width('90%')
  }
}
