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
struct REInterFace0059 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State content: string = '';

  build() {
    Column() {
      // 内容显示区域
      Column() {
        Text('编辑器内容:').width('100%')
        Text() {
          Span(this.content)
        }.width('100%')
      }
      .border({ width: 1, color: Color.Red })
      .width('100%')
      .padding(10)

      // 操作按钮
      Button('获取全部内容')
        .id('InterFace0059')
        .onClick(() => this.getAllContent())
        .margin({ top: 20 })

      // 富文本编辑器
      RichEditor(this.options)
        .onReady(() => this.initContent())
        .placeholder('输入内容...')
        .border({ width: 1, color: Color.Green })
        .width('100%')
        .height(200)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }

  // 初始化编辑内容
  private initContent() {
    this.controller.addTextSpan('测试文本 ');
    this.controller.addTextSpan('😄', { style: { fontSize: 24 } }); // Emoji
    this.controller.addSymbolSpan($r('app.media.Symbolspan001')); // 符号
    this.controller.addTextSpan(' 更多文本 ');
    this.controller.addTextSpan('🎉', { style: { fontSize: 24 } }); // Emoji
  }

  // 获取全部内容（从开始到结尾）
  private getAllContent() {
    this.content = '';

    try {
      // 获取整个编辑器的Span信息（使用足够大的end值）
      const spans = this.controller.getSpans({
        start: 0,
        end: 9999  // 使用一个足够大的值代替getTotalLength
      });

      spans.forEach(item => {
        // 直接通过属性判断类型
        if (item['imageStyle']) {
          this.content += `[图片: ${item['valueResourceStr']}]\n`;
        } else if (item['symbolType']) {
          this.content += `[符号: ${item['symbolType']}]\n`;
        } else {
          this.content += `${item['value'] || '未知内容'}\n`;
        }
      });
    } catch (error) {
      this.content = `获取内容失败: ${error.message}`;
    }
  }
}
