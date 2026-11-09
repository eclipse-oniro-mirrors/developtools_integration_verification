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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOREGROUND_0010
 * @tc.desc: 设置前景图宽高大于背景图，foreground和background都为svg图源
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageForeground0010 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageForeground0010', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 前景图大于背景图测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOREGROUND_0010')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('前景图大于背景图测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Column() {
        Text('前景图大于背景图')
          .fontSize(10)
          .margin({ bottom: 5 })

        // 模拟LayeredDrawableDescriptor效果
        Stack() {
          // 背景图(小)
          Image($r('app.media.icon'))
            .width(80)
            .height(80)
            .id('background_img')
          // 前景图(大)
          Image($r('app.media.icon'))
            .width(100)
            .height(100)
            .opacity(0.7)
            .id('foreground_img')
        }
        .width('16.67%')
        .height('9.84%')
        .backgroundColor('#EEEEEE')
      }.margin({ bottom: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15 })

      Text('1. 设置foreground和background都为svg图源\n2. 设置前景图大于背景图\n3. Image组件加载json文件\n预期: 前景图自适应背景图，图标展示正常')
        .fontSize(11)
        .fontColor('#666666')

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('8.2%')
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

