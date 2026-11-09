/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct UiComponentTextRichEditorAction0030 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column({ space: 10 }) {
      Text('空文本状态下长按')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Button('删除所有文本')
        .id('button_action_0030_delete')
        .fontSize(14)
        .width('60%')
        .alignSelf(ItemAlign.Center)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.controller.deleteSpans();
          hilog.info(0x0000, 'TEST', '已删除所有文本');
        })

      RichEditor(this.options)
        .id('rich_editor_action_0030')
        .width('100%')
        .height(200)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .onReady(() => {
          this.controller.addTextSpan(
            '==========空文本状态下长按==========\n'+
            '==========空文本状态下长按==========\n'+
            '==========空文本状态下长按==========\n'+
            '==========空文本状态下长按==========\n'+
            '==========空文本状态下长按==========',{
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          });
        })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

