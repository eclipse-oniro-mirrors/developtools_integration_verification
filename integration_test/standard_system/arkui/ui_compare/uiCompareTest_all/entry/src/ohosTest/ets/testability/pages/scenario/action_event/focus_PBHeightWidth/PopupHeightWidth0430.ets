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
import { Popup, PopupIconOptions, PopupTextOptions, PopupButtonOptions } from '@kit.ArkUI';

@Entry
@Component
struct PopupHeightWidth0430 {
  @State showPopup: boolean = false;

  @Builder
  popupBuilder() {
    Popup({
      icon: {
        image: $r('app.media.icon1'),
        width: 50
      } as PopupIconOptions,
      message: {
        text: 'Popup内容 - 测试图标宽度50px'
      } as PopupTextOptions,
      buttons: [
        {
          text: '关闭',
          action: () => { this.showPopup = false; }
        } as PopupButtonOptions
      ]
    })
  }

  build() {
    Column({ space: 20 }) {
      Text('图标宽度测试 (50px)')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
      
      Row({ space: 15 }) {
        Column({ space: 5 }) {
          Text('30px')
            .fontSize(12)
          Image($r('app.media.icon1'))
            .width(30)
            .border({ width: 1, color: Color.Gray })
        }
        
        Column({ space: 5 }) {
          Text('50px')
            .fontSize(12)
            .fontColor(Color.Blue)
            .fontWeight(FontWeight.Bold)
          Image($r('app.media.icon1'))
            .width(50)
            .border({ width: 2, color: Color.Blue })
        }
        
        Column({ space: 5 }) {
          Text('70px')
            .fontSize(12)
          Image($r('app.media.icon1'))
            .width(70)
            .border({ width: 1, color: Color.Gray })
        }
      }
      .padding(15)
      .backgroundColor('#f5f5f5')
      .borderRadius(8)
      
      Button('显示Popup')
        .id('showPopupButton0430')
        .onClick(() => {
          this.showPopup = !this.showPopup;
        })
        .margin(50)
        .bindContentCover(this.showPopup, this.popupBuilder)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
