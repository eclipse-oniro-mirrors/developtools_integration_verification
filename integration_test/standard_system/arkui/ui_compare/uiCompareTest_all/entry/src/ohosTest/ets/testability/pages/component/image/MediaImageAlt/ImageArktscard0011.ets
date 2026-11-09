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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ARKTSCARD_0011
 * @tc.desc: Image组件在ArkTS卡片中传入base64格式图片
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageArktscard0011 {
  @Local testLog: string = '';
  @Local imageLoaded: boolean = false;
  // 简单的1x1像素PNG base64图片
  private base64Image: string = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageArktscard0011', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - ArkTS卡片Base64图片测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ARKTSCARD_0011')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('ArkTS卡片中Image组件传入base64格式图片')
        .fontSize(12)
        .margin({ bottom: 10 })

      Image(this.base64Image)
        .width(150)
        .height(150)
        .id('image_base64_card')
        .backgroundColor('#EEEEEE')
        .onComplete(() => {
          this.imageLoaded = true;
          this.addLog('Base64图片加载完成');
        })
        .onError(() => {
          this.addLog('Base64图片加载失败');
        })

      Text(this.imageLoaded ? '✓ Base64图片加载成功' : '加载中...')
        .fontSize(12)
        .fontColor(this.imageLoaded ? '#00AA00' : '#666666')
        .margin({ top: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15 })

      Text('1. 创建卡片应用\n2. 添加Image组件传入base64格式图片\n预期: Image组件正常显示图片')
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

