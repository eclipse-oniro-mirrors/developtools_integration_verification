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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0014
 * @tc.desc: Image组件引入带有动画类标签元素的svg图片
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageSvgNew0014 {
  @Local testLog: string = '';
  @Local imageLoaded: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageSvgNew0014', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - SVG动画标签测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0014')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('带有动画类标签元素的SVG图片')
        .fontSize(12)
        .margin({ bottom: 10 })

      Image($r('app.media.icon'))
        .width(150)
        .height(150)
        .id('image_svg_animate')
        .onComplete(() => {
          this.imageLoaded = true;
          this.addLog('SVG图片加载完成');
        })

      Text(this.imageLoaded ? '✓ 图片正常展示' : '加载中...')
        .fontSize(12)
        .fontColor(this.imageLoaded ? '#00AA00' : '#666666')
        .margin({ top: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15 })

      Text('1. 启动测试应用\n2. 进入SVG图片组件页面\n3. 切换照片\n4. 观察带有动画类标签元素的svg图片\n预期: 图片正常展示')
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

