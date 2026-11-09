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
import { drawing, common2D } from '@kit.ArkGraphics2D';

@Entry
@Component
struct ImageOpacity02 {
  @State info:string = 'loading~~';
  @State img:ResourceStr = ('https://' + 'foruda.gitee.com' + '/images/1753255402677959741/499f5538_10080759.png');
  @State loadingStatus:number = 1;
  @State opacityAttr:number | Resource | undefined | null = 0
  imgUrl:ResourceStr[] = [
    ('https://' + 'foruda.gitee.com' + '/images/1753255402677959741/499f5538_10080759.png'),
    ('https://' + 'images.openharmony.cn' + '/活动/技术大会20240923/补充头像/默认男头像.svg'),
    ('https://' + 'www.runoob.com' + '/try/demo_source/smiley-2.gif'),
    ('http://' + 'images.openharmony.cn' + '/活动/开发者大会20250428/大会顶端banner图.jpg')
  ]
  index:number = 0;

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        Text('image test opacity')
          .height(80)
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

        Button('change image url')
          .id('imageOpacity02_01')
          .height(50)
          .fontSize(15)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .fontWeight(300)
          .margin(10)
          .onClick( () => {
            if(this.index === 3){
              this.index = -1;
            }
            this.index++;
            this.img = this.imgUrl[this.index];
          })
        
        Row(){
          Button('opacity = -1')
            .id('imageOpacity02_02')
            .height(40)
            .fontSize(15)
            .fontColor(Color.Black)
            .width('70%')
            .border({ width: 1 })
            .fontWeight(300)
            .margin(10)
            .onClick( () => {
              this.opacityAttr = -1
            })

          Button('opacity = undefined')
            .id('imageOpacity02_03')
            .height(40)
            .fontSize(15)
            .fontColor(Color.Black)
            .width('70%')
            .border({ width: 1 })
            .fontWeight(300)
            .margin(10)
            .onClick( () => {
              this.opacityAttr = undefined
            })
        }
        .width('100%')
        .height('4.92%')

        Row(){
          Button('opacity = null')
            .id('imageOpacity02_04')
            .height(40)
            .fontSize(15)
            .fontColor(Color.Black)
            .width('70%')
            .border({ width: 1 })
            .fontWeight(300)
            .margin(10)
            .onClick( () => {
              this.opacityAttr = null
            })

          Button('opacity = 2')
            .id('imageOpacity02_05')
            .height(40)
            .fontSize(15)
            .fontColor(Color.Black)
            .width('70%')
            .border({ width: 1 })
            .fontWeight(300)
            .margin(10)
            .onClick( () => {
              this.opacityAttr = 2
            })
        }
        .width('100%')
        .height('4.92%')

        Image(this.img)
          .width(150)
          .height(200)
          .borderRadius(20)
          .margin(15)
          .opacity(0.2)
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
