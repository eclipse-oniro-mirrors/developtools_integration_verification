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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0011
 * @tc.desc: 设置背景图为静图加动图适配横竖屏显示
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageAnimateDisplay0011 {
  @Local testLog: string = '';
  @Local showDynamicImage: boolean = false;
  @Local orientation: string = '竖屏';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageAnimateDisplay0011', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 静图+动图横竖屏适配测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0011')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('静图+动图适配横竖屏显示测试')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('当前方向: ' + this.orientation)
        .fontSize(11)
        .fontColor('#666666')
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
      .width('25%')
      .height('14.75%')
      .margin({ bottom: 10 })

      Row() {
        Button(this.showDynamicImage ? '静图' : '动图')
          .id('btn_toggle')
          .margin({ right: 10 })
          .onClick(() => {
            this.showDynamicImage = !this.showDynamicImage;
            this.addLog(this.showDynamicImage ? '切换到动图' : '切换到静图');
          })
        Button('模拟横屏')
          .id('btn_landscape')
          .margin({ right: 10 })
          .onClick(() => {
            this.orientation = '横屏';
            this.addLog('切换到横屏');
          })
        Button('模拟竖屏')
          .id('btn_portrait')
          .onClick(() => {
            this.orientation = '竖屏';
            this.addLog('切换到竖屏');
          })
      }.margin({ top: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 底层为静图，上层为动图\n2. 适配横竖屏、息屏后进入被动图替换\n预期: 正常加载动画效果')
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

