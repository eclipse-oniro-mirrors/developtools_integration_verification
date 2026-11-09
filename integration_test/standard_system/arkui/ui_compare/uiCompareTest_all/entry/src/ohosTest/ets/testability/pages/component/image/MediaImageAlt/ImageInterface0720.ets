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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_INTERFACE_0720
 * @tc.desc: 相对路径引用图片不支持跨包跨模块验证
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageInterface0720 {
  @Local testLog: string = '';
  @Local crossModuleError: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageInterface0720', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 跨包跨模块图片引用测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_INTERFACE_0720')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('相对路径引用图片跨包跨模块验证')
        .fontSize(12)
        .margin({ bottom: 10 })

      Column() {
        Text('尝试跨模块引用图片')
          .fontSize(11)
          .margin({ bottom: 5 })

        // 模拟跨模块引用失败
        Image('../other_module/images/test.png')
          .width(100)
          .height(100)
          .id('cross_module_image')
          .backgroundColor('#EEEEEE')
          .onError(() => {
            this.crossModuleError = true;
            this.addLog('跨模块引用失败 - 符合预期');
          })
          .onComplete(() => {
            this.addLog('图片加载成功');
          })
      }.margin({ bottom: 10 })

      Text(this.crossModuleError ? '✓ 跨模块引用失败(符合预期)' : '等待验证...')
        .fontSize(12)
        .fontColor(this.crossModuleError ? '#00AA00' : '#666666')

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15 })

      Text('1. 以相对路径的方式引用跨包跨模块一张图片\n2. 编译运行代码\n预期: 不支持跨包跨模块引入图片')
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

