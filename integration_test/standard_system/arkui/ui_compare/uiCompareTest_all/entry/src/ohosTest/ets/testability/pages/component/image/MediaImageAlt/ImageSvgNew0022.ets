/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

/**
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0022
 * @tc.desc: Image组件引入带有各类标签元素的svg图片，切换padding属性
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageSvgNew0022 {
  @Local testLog: string = '';
  @Local currentPadding: number = 0;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageSvgNew0022', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - SVG padding测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0022')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('SVG图片切换padding属性')
        .fontSize(12)
        .margin({ bottom: 10 })

      Column() {
        Image($r('app.media.icon'))
          .width(100)
          .height(100)
          .padding(this.currentPadding)
          .id('image_svg_padding')
          .backgroundColor('#EEEEEE')
      }
      .width('20.83%')
      .height('12.3%')
      .backgroundColor('#DDDDDD')
      .justifyContent(FlexAlign.Center)

      Text('当前padding: ' + this.currentPadding)
        .fontSize(12)
        .margin({ top: 10 })

      Row() {
        Button('0')
          .id('btn_p0')
          .fontSize(11)
          .margin({ right: 5 })
          .onClick(() => {
            this.currentPadding = 0;
            this.addLog('设置padding: 0');
          })
        Button('10')
          .id('btn_p10')
          .fontSize(11)
          .margin({ right: 5 })
          .onClick(() => {
            this.currentPadding = 10;
            this.addLog('设置padding: 10');
          })
        Button('20')
          .id('btn_p20')
          .fontSize(11)
          .margin({ right: 5 })
          .onClick(() => {
            this.currentPadding = 20;
            this.addLog('设置padding: 20');
          })
        Button('30')
          .id('btn_p30')
          .fontSize(11)
          .onClick(() => {
            this.currentPadding = 30;
            this.addLog('设置padding: 30');
          })
      }.margin({ top: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15 })

      Text('1. 切换照片\n2. 点击padding切换效果\n预期: 效果生效，图片正常显示')
        .fontSize(11)
        .fontColor('#666666')

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('6.56%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

