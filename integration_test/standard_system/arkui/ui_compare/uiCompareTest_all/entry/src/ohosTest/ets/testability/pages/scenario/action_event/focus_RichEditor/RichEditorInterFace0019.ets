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

@Entry
@Component
struct ReIF0019 {
  private controller: RichEditorController = new RichEditorController();
  @State selectionInfo: string = '未选择内容';

  build() {
    Column() {
      // 富文本编辑器
      RichEditor({ controller: this.controller })
        .width('90%')
        .height(200)
        .backgroundColor('#F5F5F5')
        .onReady(() => {
          this.controller.addTextSpan('这是一段测试文本。', {
            style: {
              fontColor: Color.Black,
              fontSize: 15
            }
          })
        })
        .margin({ bottom: 20 })

      // 获取选区按钮
      Button('获取选区信息')
        .id('InterFace0019')
        .onClick(() => this.handleGetSelection())
        .width('50%')
        .margin({ bottom: 20 })

      // 显示选区信息
      Text(this.selectionInfo)
        .width('90%')
        .backgroundColor('#F0F0F0')
        .padding(10)
        .textAlign(TextAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }

  // 处理获取选区信息
  private handleGetSelection() {
    try {
      // 获取选区信息
      const selection = this.controller.getSelection();

      // 打印完整的选区信息到控制台
      console.log(JSON.stringify(selection));

      // 根据实际返回结构解析选区信息
      if (selection && Array.isArray(selection.selection) && selection.selection.length === 2) {
        let start = 0;
        let end = 0;
        if (selection && Array.isArray(selection.selection) && selection.selection.length === 2) {
          start = selection.selection[0];
          end = selection.selection[1];
        }

        if (start === end) {
          this.selectionInfo = `光标位置: ${start}`;
        } else {
          this.selectionInfo = `选区范围: ${start} - ${end}`;
        }
      } else {
        this.selectionInfo = '无法解析选区信息';
        console.warn('getSelection() 返回格式不符合预期:', selection);
      }
    } catch (error) {
      this.selectionInfo = `获取选区失败: ${error.message}`;
      console.error('获取选区信息失败:', error);
    }
  }
}
