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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0024
 * @tc.desc: Image组件引入带有各类标签元素的svg图片，设置draggable属性为true
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageSvgNew0024 {
  @Local testLog: string = '';
  @Local isDraggable: boolean = true;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageSvgNew0024', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - SVG draggable测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0024')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('SVG图片设置draggable属性为true')
        .fontSize(12)
        .margin({ bottom: 10 })

      Image($r('app.media.icon'))
        .width(120)
        .height(120)
        .draggable(this.isDraggable)
        .id('image_svg_draggable')
        .onDragStart(() => {
          this.addLog('开始拖拽');
          return undefined;
        })
        .onDragEnd(() => {
          this.addLog('拖拽结束');
        })

      Text('draggable: ' + (this.isDraggable ? 'true' : 'false'))
        .fontSize(12)
        .margin({ top: 10 })

      Button(this.isDraggable ? '禁用拖拽' : '启用拖拽')
        .id('btn_toggle_drag')
        .margin({ top: 10 })
        .onClick(() => {
          this.isDraggable = !this.isDraggable;
          this.addLog('设置draggable: ' + this.isDraggable);
        })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15 })

      Text('1. 切换照片\n2. 设置draggable属性为true\n预期: 效果生效，图片正常显示\n请尝试拖拽图片验证')
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

