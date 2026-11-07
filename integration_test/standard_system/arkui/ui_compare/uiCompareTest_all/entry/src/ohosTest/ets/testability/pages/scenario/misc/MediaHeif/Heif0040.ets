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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0040
 * @tc.desc: 设置image组件src属性为heif格式图片，同时设置objectRepeat属性
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Heif0040 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'Heif0040', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - HEIF objectRepeat属性测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0040')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('HEIF图片objectRepeat属性测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Column() {
        Text('objectRepeat: Y (垂直重复)')
          .fontSize(10)
          .margin({ bottom: 5 })
        Image($r('app.media.icon'))
          .width(100)
          .height(200)
          .objectFit(ImageFit.None)
          .objectRepeat(ImageRepeat.Y)
          .id('heif_repeat_y')
          .backgroundColor('#EEEEEE')
          .onComplete(() => {
            this.addLog('Y重复模式加载完成');
          })
      }.margin({ bottom: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 设置Src为引用heif格式资源图片\n2. 设置objectRepeat属性为Y\n预期: 重复图片均可以正常显示')
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

