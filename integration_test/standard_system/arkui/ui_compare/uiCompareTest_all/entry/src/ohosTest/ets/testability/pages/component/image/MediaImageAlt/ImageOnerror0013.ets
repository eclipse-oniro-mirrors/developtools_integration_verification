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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0013
 * @tc.desc: Image组件引入非网络图源图片，base64字符串错误时触发OnError回调
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageOnerror0013 {
  @Local testLog: string = '';
  @Local errorTriggered: boolean = false;
  // 错误的base64字符串
  private invalidBase64: string = 'data:image/png;base64,ADKIDXXXXX_INVALID';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageOnerror0013', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - Base64错误OnError测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0013')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Base64字符串错误触发OnError')
        .fontSize(12)
        .margin({ bottom: 10 })

      Image(this.invalidBase64)
        .width(120)
        .height(120)
        .id('image_base64_error')
        .backgroundColor('#EEEEEE')
        .onError((event) => {
          this.errorTriggered = true;
          this.addLog('OnError触发 - Base64字符串错误');
        })

      Text(this.errorTriggered ? '✓ OnError已触发' : '等待验证...')
        .fontSize(12)
        .fontColor(this.errorTriggered ? '#00AA00' : '#666666')
        .margin({ top: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15 })

      Text('1. 引入非网络图源图片\n2. base64字符串错误\n预期: 触发OnError回调')
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

