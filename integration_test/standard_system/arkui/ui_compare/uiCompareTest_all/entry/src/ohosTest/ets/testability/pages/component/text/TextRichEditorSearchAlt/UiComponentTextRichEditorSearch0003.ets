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
import { text } from '@kit.ArkGraphics2D';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct UiComponentTextRichEditorSearch0003 {
  controller1: RichEditorController = new RichEditorController();
  options1: RichEditorOptions = { controller: this.controller1 };
  controller2: RichEditorController = new RichEditorController();
  options2: RichEditorOptions = { controller: this.controller2 };

  build() {
    Column({ space: 10 }) {
      Text('复制后再选中全部内容，验证搜索菜单位置')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })

      // 第一个 RichEditor：用于复制内容
      Text('RichEditor 1: 复制源')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 5 })

      RichEditor(this.options1)
        .id('rich_editor_search_0003_01')
        .width('100%')
        .height(150)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .onReady(() => {
          this.controller1.addTextSpan('这是测试内容，用于复制粘贴后验证搜索菜单位置。', {
            style: {
              fontColor: Color.Black,
              fontSize: 16
            }
          })
        })

      // 第二个 RichEditor：用于粘贴内容
      Text('RichEditor 2: 粘贴目标')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ top: 10, bottom: 5 })

      RichEditor(this.options2)
        .id('rich_editor_search_0003_02')
        .width('100%')
        .height(150)
        .backgroundColor('#FFF8DC')
        .border({ width: 2, color: Color.Orange })
        .borderRadius(8)
        .padding(8)
        .onReady(() => {
          this.controller2.addTextSpan('（空白区域，用于粘贴）', {
            style: {
              fontColor: Color.Gray,
              fontSize: 14
            }
          })
        })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

