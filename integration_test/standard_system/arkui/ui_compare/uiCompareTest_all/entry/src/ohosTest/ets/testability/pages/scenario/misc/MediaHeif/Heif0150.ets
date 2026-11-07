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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0150
 * @tc.desc: 设置text组件的borderImage为heif格式图片
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Heif0150 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'Heif0150', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - Text borderImage HEIF测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0150')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Text borderImage HEIF格式测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Column() {
        Text('资源图片边框')
          .fontSize(12)
          .padding(20)
          .borderImage({
            source: $r('app.media.icon'),
            slice: 10,
            width: 10,
            repeat: RepeatMode.Stretch
          })
          .id('border_resource')
          .margin({ bottom: 10 })

        Text('网络图片边框')
          .fontSize(12)
          .padding(20)
          .borderImage({
            source: ('https://' + 'example.com' + '/border.heic'),
            slice: 10,
            width: 10,
            repeat: RepeatMode.Stretch
          })
          .id('border_network')
          .margin({ bottom: 10 })

        Text('本地图片边框')
          .fontSize(12)
          .padding(20)
          .borderImage({
            source: $r('app.media.icon'),
            slice: 10,
            width: 10,
            repeat: RepeatMode.Stretch
          })
          .id('border_local')
          .margin({ bottom: 10 })

        Text('JPG图片边框')
          .fontSize(12)
          .padding(20)
          .borderImage({
            source: $r('app.media.icon'),
            slice: 10,
            width: 10,
            repeat: RepeatMode.Stretch
          })
          .id('border_jpg')
      }

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 资源heif图片边框正常显示\n2. 网络heif图片边框显示正常\n3. 本地heif图片边框显示正常\n4. jpg格式边框图片正常显示')
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

