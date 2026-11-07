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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0011
 * @tc.desc: Image组件设置opacity属性为异常值
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageOpacity0011 {
  @Local testLog: string = '';
  @Local currentOpacity: number = 1;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageOpacity0011', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - Opacity异常值测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0011')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Opacity属性异常值测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Image($r('app.media.icon'))
        .width(120)
        .height(120)
        .opacity(this.currentOpacity)
        .id('image_opacity')
        .backgroundColor('#EEEEEE')

      Text('当前opacity: ' + this.currentOpacity)
        .fontSize(12)
        .margin({ top: 10 })

      Row() {
        Button('-1')
          .id('btn_neg1')
          .fontSize(11)
          .margin({ right: 5 })
          .onClick(() => {
            this.currentOpacity = -1;
            this.addLog('设置opacity: -1');
          })
        Button('2')
          .id('btn_2')
          .fontSize(11)
          .margin({ right: 5 })
          .onClick(() => {
            this.currentOpacity = 2;
            this.addLog('设置opacity: 2');
          })
        Button('0.5')
          .id('btn_05')
          .fontSize(11)
          .margin({ right: 5 })
          .onClick(() => {
            this.currentOpacity = 0.5;
            this.addLog('设置opacity: 0.5');
          })
        Button('1')
          .id('btn_1')
          .fontSize(11)
          .onClick(() => {
            this.currentOpacity = 1;
            this.addLog('设置opacity: 1');
          })
      }.margin({ top: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15 })

      Text('1. 设置opacity属性为-1/undefined/null/2\n预期: 图片显示原图，不透明')
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

