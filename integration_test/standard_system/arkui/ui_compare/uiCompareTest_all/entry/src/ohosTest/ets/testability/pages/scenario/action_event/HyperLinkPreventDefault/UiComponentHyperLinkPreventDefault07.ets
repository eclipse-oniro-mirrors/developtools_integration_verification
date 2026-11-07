/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { promptAction } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct UiComponentHyperLinkPreventDefault07 {
  @State text:string='Block onclick and touch'
  @State count:number=0

  build() {
    Column() {
      Column() {
        Text(this.text)
          .fontSize(15)
          .fontColor(0xCCCCCC)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .margin(30)
          .padding(10)
          .fontColor(Color.Black)
          .fontStyle(FontStyle.Italic)
          .height(100)
        Hyperlink('https:1111','Go to the developer website') {
        }
        .id('UiComponentHyperLinkPreventDefault07')
        .onClick((event)=>{
          event.preventDefault();
          try {
            promptAction.showToast({
              message: 'preventDefault onClick',
              duration: 2000
            });
          } catch (error) {
            let message = (error as BusinessError).message
            let code = (error as BusinessError).code
            console.error(`showToast args error code is ${code}, message is ${message}`);
          };
        })
        .onTouch((event)=>{
          event.preventDefault();
          try {
            promptAction.showToast({
              message: 'preventDefault onTouch',
              duration: 2000
            });
          } catch (error) {
            let message = (error as BusinessError).message
            let code = (error as BusinessError).code
            console.error(`showToast args error code is ${code}, message is ${message}`);
          };
          console.log('onTouch success')
        })
        .color(Color.Blue)
        Text('onTouch count is:'+this.count)
          .fontSize(15)
          .fontColor(Color.Blue)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}