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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0020
 * @tc.desc: Image组件引入带有各类标签元素的svg图片，切换colorFilter属性
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageSvgNew0020 {
  @Local testLog: string = '';
  @Local filterEnabled: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageSvgNew0020', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - SVG colorFilter测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0020')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('SVG图片切换colorFilter属性')
        .fontSize(12)
        .margin({ bottom: 10 })

      if (this.filterEnabled) {
        Image($r('app.media.icon'))
          .width(120)
          .height(120)
          .colorFilter([
            1, 0, 0, 0, 0,
            0, 1, 0, 0, 0,
            0, 0, 1, 0, 0,
            0, 0, 0, 1, 0
          ])
          .id('image_svg_colorfilter')
      } else {
        Image($r('app.media.icon'))
          .width(120)
          .height(120)
          .id('image_svg_colorfilter')
      }

      Button(this.filterEnabled ? '移除滤镜' : '应用滤镜')
        .id('btn_toggle_filter')
        .margin({ top: 10 })
        .onClick(() => {
          this.filterEnabled = !this.filterEnabled;
          this.addLog(this.filterEnabled ? '应用colorFilter' : '移除colorFilter');
        })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15 })

      Text('1. 切换照片\n2. 点击colorFilter切换效果\n预期: 效果生效，图片正常显示')
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

