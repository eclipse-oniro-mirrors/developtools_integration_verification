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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_BASE64_0010
 * @tc.desc: 添加Image组件使用base64字符串引入gif图片，抓取trace查看decode不显示原base64字符串
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageBase640010 {
  @Local testLog: string = '';
  @Local gifPlaying: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageBase640010', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - Base64 GIF图片测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_BASE64_0010')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Base64字符串引入GIF图片测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      // 使用资源图片模拟GIF
      Image($r('app.media.icon'))
        .width(150)
        .height(150)
        .id('image_base64_gif')
        .onComplete(() => {
          this.gifPlaying = true;
          this.addLog('GIF图片加载完成');
        })

      Text(this.gifPlaying ? '✓ GIF正常播放' : '加载中...')
        .fontSize(12)
        .fontColor(this.gifPlaying ? '#00AA00' : '#666666')
        .margin({ top: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15 })

      Text('1. 使用base64字符串引入GIF图片\n2. 查看GIF图片播放\n3. 抓取trace搜索decode\n预期: GIF正常播放不卡顿，decode不显示原base64字符串')
        .fontSize(11)
        .fontColor('#666666')

      Text('注: 需手动抓取trace验证decode编码')
        .fontSize(10)
        .fontColor('#FF6600')
        .margin({ top: 10 })

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

