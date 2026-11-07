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

import { Popup, PopupTextOptions, PopupButtonOptions, PopupIconOptions } from '@kit.ArkUI';

@Entry
@Component
struct PopupMaxWidth0180 {
  @State isPopupVisible: boolean = false;

  // 使用builder构建高级组件popup
  @Builder
  popupBuilder() {
    Popup({
      // 设置maxWidth为300vp
      maxWidth: '300vp',
      // PopupIconOptions类型设置图标内容
      icon: {
        image: $r('app.media.icon'),
        width: 32,
        height: 32,
        fillColor: Color.White,
        borderRadius: 16
      } as PopupIconOptions,
      // PopupTextOptions类型设置标题内容
      title: {
        text: '动效打断测试',
        fontSize: 18,
        fontColor: Color.Black,
        fontWeight: FontWeight.Medium
      } as PopupTextOptions,
      // PopupTextOptions类型设置消息内容
      message: {
        text: 'maxWidth设置为300vp,在弹出过程中进行动效打断,验证Popup宽度仍为300vp,文本正常显示。',
        fontSize: 14,
        fontColor: Color.Black
      } as PopupTextOptions,
      showClose: true,
      onClose: () => {
        console.info('close Button click');
        this.isPopupVisible = false;
      },
      // PopupButtonOptions类型设置按钮内容
      buttons: [{
        text: '确定',
        action: () => {
          console.info('confirm button click');
          this.isPopupVisible = false;
        },
        fontSize: 14,
        fontColor: Color.Black,
      },
      {
        text: '取消',
        action: () => {
          console.info('cancel button click');
          this.isPopupVisible = false;
        },
        fontSize: 14,
        fontColor: Color.Black
      },] as [PopupButtonOptions?, PopupButtonOptions?]
    })
  }

  build() {
    Column() {
      // 上方区域 - 触发按钮
      Button('点击弹出Popup')
        .id('showPopupButton0180')
        .fontSize(16)
        .width(200)
        .height(50)
        .margin({ top: 50 })
        .onClick(() => {
          this.isPopupVisible = true;
        })

      // 使用bindPopup绑定popup builder (绑定到上方按钮附近的锚点)
      Text('')
        .width(1)
        .height(1)
        .margin({ top: 10 })
        .bindPopup(this.isPopupVisible, {
          builder: this.popupBuilder,
          placement: Placement.Bottom,
          enableArrow: true,
          onStateChange: (e) => {
            console.info('popup state change: ' + JSON.stringify(e));
            if (!e.isVisible) {
              this.isPopupVisible = false;
            }
          }
        })
      
      // 增加间距,将动效打断按钮放在下方
      Blank()
        .height(300)

      // 下方区域 - 动效打断按钮
      Button('动效打断')
        .id('interruptButton0180')
        .fontSize(16)
        .width(200)
        .height(50)
        .backgroundColor(Color.Orange)
        .onClick(() => {
          // 在popup弹出过程中点击此按钮进行动效打断
          console.info('interrupt animation button click');
          // 可以快速切换状态来打断动效
          this.isPopupVisible = false;
          setTimeout(() => {
            this.isPopupVisible = true;
          }, 50);
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}

