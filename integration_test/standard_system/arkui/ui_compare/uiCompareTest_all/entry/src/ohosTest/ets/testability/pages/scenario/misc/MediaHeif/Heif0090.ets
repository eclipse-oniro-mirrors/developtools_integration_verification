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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0090
 * @tc.desc: 设置imageSpan组件value属性为heif格式，加载成功执行onComplete回调，失败执行onError回调
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Heif0090 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'Heif0090', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - ImageSpan HEIF格式测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0090')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('ImageSpan HEIF格式value属性测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Text() {
        Span('资源图片: ')
        ImageSpan($r('app.media.icon'))
          .width(50)
          .height(50)
          .id('imagespan_resource')
          .onComplete((event) => {
            this.addLog('资源图片onComplete: ' + JSON.stringify(event));
          })
          .onError((event) => {
            this.addLog('资源图片onError: ' + JSON.stringify(event));
          })
      }.margin({ bottom: 10 })

      Text() {
        Span('网络图片: ')
        ImageSpan(('https://' + 'example.com' + '/test.heic'))
          .width(50)
          .height(50)
          .id('imagespan_network')
          .onComplete((event) => {
            this.addLog('网络图片onComplete: ' + JSON.stringify(event));
          })
          .onError((event) => {
            this.addLog('网络图片onError回调');
          })
      }.margin({ bottom: 10 })

      Text() {
        Span('本地图片: ')
        ImageSpan($r('app.media.icon'))
          .width(50)
          .height(50)
          .id('imagespan_local')
          .onComplete((event) => {
            this.addLog('本地图片onComplete: ' + JSON.stringify(event));
          })
          .onError((event) => {
            this.addLog('本地图片onError: ' + JSON.stringify(event));
          })
      }.margin({ bottom: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 资源图片: 执行onComplete回调\n2. 网络图片: 加载失败执行onError回调\n3. 本地图片: 执行onComplete回调')
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

