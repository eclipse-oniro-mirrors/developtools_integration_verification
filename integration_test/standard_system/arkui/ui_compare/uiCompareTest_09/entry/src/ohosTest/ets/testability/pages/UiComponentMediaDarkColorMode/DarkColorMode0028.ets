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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0028
 * @tc.desc: 手机设置深色模式，QRCode在手机应用中的展示效果
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct DarkColorMode0028 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'DarkColorMode0028', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - QRCode应用场景深色模式测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0028')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('QRCode应用场景-深色模式')
        .fontSize(12)
        .margin({ bottom: 20 })

      Column() {
        QRCode('我的二维码')
          .width(100)
          .height(100)
          .id('qr_code')
          .color(Color.Black)
          .backgroundColor(Color.White)

        Text('我的二维码')
          .fontSize(12)
          .margin({ top: 5 })
      }
      .padding(15)
      .backgroundColor('#2A2A2A')
      .borderRadius(10)

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 设置手机模式为深色模式\n2. 智慧生活中查看我的二维码\n3. 期望: 二维码颜色正常\n4. 周围背景为设置的深色模式')
        .fontSize(11)
        .fontColor('#666666')

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('4.92%')
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

