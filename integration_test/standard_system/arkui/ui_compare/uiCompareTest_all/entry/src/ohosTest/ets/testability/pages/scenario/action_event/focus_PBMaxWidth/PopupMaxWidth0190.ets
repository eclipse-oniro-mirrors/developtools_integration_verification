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
struct PopupMaxWidth0190 {
  @State isPopupVisible: boolean = false;
  @State toggleCount: number = 0;

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
        text: '频繁调起关闭测试',
        fontSize: 18,
        fontColor: Color.Black,
        fontWeight: FontWeight.Medium
      } as PopupTextOptions,
      // PopupTextOptions类型设置消息内容
      message: {
        text: `maxWidth设置为300vp,频繁调起和关闭测试。当前切换次数: ${this.toggleCount}`,
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
      // 显示切换次数
      Text(`切换次数: ${this.toggleCount}`)
        .fontSize(18)
        .fontColor(Color.Black)
        .margin({ top: 30, bottom: 20 })

      // 显示/隐藏切换按钮
      Button(this.isPopupVisible ? '关闭Popup' : '显示Popup')
        .id('togglePopupButton0190')
        .fontSize(16)
        .width(200)
        .height(50)
        .margin({ bottom: 20 })
        .backgroundColor(this.isPopupVisible ? Color.Red : Color.Blue)
        .onClick(() => {
          this.isPopupVisible = !this.isPopupVisible;
          this.toggleCount++;
          console.info(`Popup toggled, count: ${this.toggleCount}, visible: ${this.isPopupVisible}`);
        })

      // 快速切换按钮(用于自动化频繁切换)
      Button('快速切换10次')
        .id('rapidToggleButton0190')
        .fontSize(16)
        .width(200)
        .height(50)
        .backgroundColor(Color.Orange)
        .onClick(() => {
          console.info('Rapid toggle started');
          let count = 0;
          const interval = setInterval(() => {
            if (count >= 10) {
              clearInterval(interval);
              console.info('Rapid toggle completed');
              return;
            }
            this.isPopupVisible = !this.isPopupVisible;
            this.toggleCount++;
            count++;
            console.info(`Rapid toggle ${count}/10, visible: ${this.isPopupVisible}`);
          }, 300); // 每300ms切换一次
        })

      // 使用bindPopup绑定popup builder
      Text('')
        .width(1)
        .height(1)
        .margin({ top: 20 })
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
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}

