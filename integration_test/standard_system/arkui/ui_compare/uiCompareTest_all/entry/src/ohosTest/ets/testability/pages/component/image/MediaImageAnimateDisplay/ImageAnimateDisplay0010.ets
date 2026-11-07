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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0010
 * @tc.desc: 设置背景图为静图加动图显示
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageAnimateDisplay0010 {
  @Local testLog: string = '';
  @Local showDynamicImage: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageAnimateDisplay0010', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 静图加动图显示测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0010')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('静图加动图显示测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Stack() {
        // 底层静图
        Image($r('app.media.icon'))
          .width('100%')
          .height('100%')
          .id('static_bg')

        // 上层动图
        if (this.showDynamicImage) {
          Image($r('app.media.icon'))
            .width('100%')
            .height('100%')
            .id('dynamic_fg')
        }
      }
      .width('27.78%')
      .height('16.39%')
      .margin({ bottom: 10 })

      Row() {
        Button(this.showDynamicImage ? '显示静图' : '显示动图')
          .id('btn_toggle')
          .onClick(() => {
            this.showDynamicImage = !this.showDynamicImage;
            this.addLog(this.showDynamicImage ? '切换到动图' : '切换到静图');
          })
      }.margin({ top: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 设置底层为静图，上层为动图\n2. 返回后重新进入，全页面被动图替换\n预期: 动图显示正常')
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

