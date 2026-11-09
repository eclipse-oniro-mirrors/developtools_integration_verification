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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ARKTSCARD_0013
 * @tc.desc: Image组件在ArkTS卡片中传入图片后进行深浅模式切换
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageArktscard0013 {
  @Local testLog: string = '';
  @Local isDarkMode: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageArktscard0013', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 深浅模式切换测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ARKTSCARD_0013')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('深浅模式切换后Image组件显示测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Column() {
        Image($r('app.media.icon'))
          .width(120)
          .height(120)
          .id('image_mode_switch')
          .onComplete(() => {
            this.addLog('图片加载完成 - ' + (this.isDarkMode ? '深色模式' : '浅色模式'));
          })
      }
      .width('20.83%')
      .height('12.3%')
      .backgroundColor(this.isDarkMode ? '#333333' : '#FFFFFF')
      .justifyContent(FlexAlign.Center)

      Text('当前: ' + (this.isDarkMode ? '深色模式' : '浅色模式'))
        .fontSize(12)
        .margin({ top: 10 })

      Button('切换深浅模式')
        .id('btn_toggle_mode')
        .margin({ top: 10 })
        .onClick(() => {
          this.isDarkMode = !this.isDarkMode;
          this.addLog('切换到' + (this.isDarkMode ? '深色模式' : '浅色模式'));
        })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15 })

      Text('1. 创建卡片应用，添加Image组件\n2. 进行深浅模式切换\n预期: 切换后Image组件正常显示图片')
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
    .backgroundColor(this.isDarkMode ? '#1A1A1A' : '#FFFFFF')
  }
}

