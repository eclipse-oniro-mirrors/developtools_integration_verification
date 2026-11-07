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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0070
 * @tc.desc: 设置image组件src属性为heif格式图片，同时设置copyOption属性
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Heif0070 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'Heif0070', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - HEIF copyOption属性测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0070')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('HEIF图片copyOption属性测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Column() {
        Text('copyOption: InApp (长按可复制)')
          .fontSize(10)
          .margin({ bottom: 5 })
        Image($r('app.media.icon'))
          .width(150)
          .height(150)
          .copyOption(CopyOptions.InApp)
          .id('heif_copy_inapp')
          .onComplete(() => {
            this.addLog('copyOption InApp 加载完成');
          })
      }.margin({ bottom: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 设置Src为引用heif格式资源图片\n2. 设置copyOption属性为InApp\n预期: 图片正常显示，长按可以选中复制')
        .fontSize(11)
        .fontColor('#666666')

      Text('请长按图片测试复制功能')
        .fontSize(12)
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

