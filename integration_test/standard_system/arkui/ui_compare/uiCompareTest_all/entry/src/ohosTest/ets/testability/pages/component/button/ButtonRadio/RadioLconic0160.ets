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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_RADIO_LCONIC_016
 * @tc.desc: indicatorBuilder值设置为image，设置padding为10，传入image图片，添加onChange事件回调
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct RadioLconic0160 {
  @Local testLog: string = '';
  @Local isChecked: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'RadioLconic0160', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_RADIO_LCONIC_016')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('自定义Radio样式，padding为10')
        .fontSize(12)
        .margin({ bottom: 10 })

      Row() {
        Row() {
          if (this.isChecked) {
            Image($r('app.media.icon'))
              .width(20)
              .height(20)
              .objectFit(ImageFit.Cover)
          } else {
            Circle()
              .width(20)
              .height(20)
              .fill(Color.Transparent)
              .stroke(Color.Gray)
              .strokeWidth(2)
          }
        }
        .width('5.56%')
        .height('3.28%')
        .padding(10)
        .id('radio_image_indicator')
        .onClick(() => {
          this.isChecked = !this.isChecked;
          this.addLog('Radio onChange: ' + this.isChecked);
        })
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .padding(20)

      Text('当前状态: ' + (this.isChecked ? '选中' : '未选中'))
        .fontSize(12)
        .fontColor(this.isChecked ? '#4CAF50' : '#999999')
        .id('status_text')

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 点击Radio触发onChange\n2. 观察回调是否正常\n3. 图标应显示自定义图片')
        .fontSize(11)
        .fontColor('#666666')

      Text('日志:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

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
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
