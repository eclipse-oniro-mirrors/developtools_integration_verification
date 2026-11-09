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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SRC_0010
 * @tc.desc: 引入网络图片，删除缓存后反复跳转页面，网络图片不会重复下载
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageSrc0010 {
  @Local testLog: string = '';
  @Local pageEnterCount: number = 0;
  @Local imageLoaded: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageSrc0010', message);
  }

  aboutToAppear(): void {
    this.pageEnterCount++;
    this.addLog('Page loaded - 进入次数: ' + this.pageEnterCount);
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SRC_0010')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('网络图片缓存测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Image(('https://' + 'example.com' + '/test_image.png'))
        .width(120)
        .height(120)
        .id('image_network_cache')
        .backgroundColor('#EEEEEE')
        .onComplete(() => {
          this.imageLoaded = true;
          this.addLog('图片加载完成');
        })
        .onError(() => {
          this.addLog('图片加载失败');
        })

      Text('页面进入次数: ' + this.pageEnterCount)
        .fontSize(12)
        .margin({ top: 10 })

      Button('模拟跳转返回')
        .id('btn_simulate_nav')
        .margin({ top: 10 })
        .onClick(() => {
          this.pageEnterCount++;
          this.addLog('模拟第' + this.pageEnterCount + '次进入');
        })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15 })

      Text('1. 引入网络图片，删除缓存\n2. 反复跳转页面\n预期: 网络图片不会重复下载')
        .fontSize(11)
        .fontColor('#666666')

      Text('注: 需通过网络抓包验证是否重复下载')
        .fontSize(10)
        .fontColor('#FF6600')
        .margin({ top: 5 })

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

