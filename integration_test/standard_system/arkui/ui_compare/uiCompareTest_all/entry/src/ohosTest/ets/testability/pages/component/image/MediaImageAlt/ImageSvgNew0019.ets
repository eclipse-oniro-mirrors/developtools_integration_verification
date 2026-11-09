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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0019
 * @tc.desc: Image组件引入带有各类标签元素的svg图片，切换objectRepeat属性，不生效
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageSvgNew0019 {
  @Local testLog: string = '';
  @Local currentRepeat: ImageRepeat = ImageRepeat.NoRepeat;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageSvgNew0019', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - SVG objectRepeat测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0019')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('SVG图片切换objectRepeat属性(预期不生效)')
        .fontSize(11)
        .margin({ bottom: 10 })

      Image($r('app.media.icon'))
        .width(150)
        .height(150)
        .objectRepeat(this.currentRepeat)
        .id('image_svg_objectrepeat')
        .backgroundColor('#EEEEEE')

      Row() {
        Button('NoRepeat')
          .id('btn_norepeat')
          .fontSize(10)
          .margin({ right: 5 })
          .onClick(() => {
            this.currentRepeat = ImageRepeat.NoRepeat;
            this.addLog('设置objectRepeat: NoRepeat');
          })
        Button('X')
          .id('btn_x')
          .fontSize(10)
          .margin({ right: 5 })
          .onClick(() => {
            this.currentRepeat = ImageRepeat.X;
            this.addLog('设置objectRepeat: X (预期不生效)');
          })
        Button('Y')
          .id('btn_y')
          .fontSize(10)
          .margin({ right: 5 })
          .onClick(() => {
            this.currentRepeat = ImageRepeat.Y;
            this.addLog('设置objectRepeat: Y (预期不生效)');
          })
        Button('XY')
          .id('btn_xy')
          .fontSize(10)
          .onClick(() => {
            this.currentRepeat = ImageRepeat.XY;
            this.addLog('设置objectRepeat: XY (预期不生效)');
          })
      }.margin({ top: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15 })

      Text('1. 切换照片\n2. 点击objectRepeat切换效果\n预期: 观察效果不生效')
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

