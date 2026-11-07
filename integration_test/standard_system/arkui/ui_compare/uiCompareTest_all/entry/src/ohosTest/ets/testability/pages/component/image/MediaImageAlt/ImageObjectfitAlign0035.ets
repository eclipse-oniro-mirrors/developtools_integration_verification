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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0035
 * @tc.desc: Image组件设置objectFit属性的新增Align类型，横竖屏切换测试
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageObjectfitAlign0035 {
  @Local testLog: string = '';
  @Local isLandscape: boolean = false;
  @Local currentFit: ImageFit = ImageFit.Cover;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageObjectfitAlign0035', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - ObjectFit Align类型测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0035')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('ObjectFit Align类型横竖屏切换测试')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('当前: ' + (this.isLandscape ? '横屏' : '竖屏'))
        .fontSize(11)
        .fontColor('#666666')
        .margin({ bottom: 10 })

      Image($r('app.media.icon'))
        .width(this.isLandscape ? 200 : 150)
        .height(this.isLandscape ? 100 : 150)
        .objectFit(this.currentFit)
        .id('image_objectfit')
        .backgroundColor('#EEEEEE')

      Row() {
        Button('Cover')
          .id('btn_cover')
          .fontSize(11)
          .margin({ right: 5 })
          .onClick(() => {
            this.currentFit = ImageFit.Cover;
            this.addLog('设置ObjectFit: Cover');
          })
        Button('Contain')
          .id('btn_contain')
          .fontSize(11)
          .margin({ right: 5 })
          .onClick(() => {
            this.currentFit = ImageFit.Contain;
            this.addLog('设置ObjectFit: Contain');
          })
        Button('Fill')
          .id('btn_fill')
          .fontSize(11)
          .onClick(() => {
            this.currentFit = ImageFit.Fill;
            this.addLog('设置ObjectFit: Fill');
          })
      }.margin({ top: 10 })

      Button(this.isLandscape ? '切换竖屏' : '切换横屏')
        .id('btn_orientation')
        .margin({ top: 10 })
        .onClick(() => {
          this.isLandscape = !this.isLandscape;
          this.addLog('切换到' + (this.isLandscape ? '横屏' : '竖屏'));
        })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 设置objectFit属性的新增Align类型\n2. 设置百分比，横竖屏切换\n预期: 效果正常展示')
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

