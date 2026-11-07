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
struct UiComponentTextRichEditorSearch0004 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      Text('搜索菜单显示不全，显示在拓展菜单内')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })

      RichEditor(this.options)
        .id('rich_editor_search_0004')
        .width('100%')
        .height('100%')
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(10)
        .onReady(() => {
          // 使用 for 循环添加多行测试文本
          for (let i = 1; i <= 20; i++) {
            this.controller.addTextSpan(`这是第${i}行测试文本，用于验证搜索菜单在空间不足时的显示情况。\n`, {
              style: {
                fontColor: Color.Black,
                fontSize: 16
              }
            })
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#F6F7F9')
  }
}

