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
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct UiComponentTextRichEditorCopyPasteAttributeStrings0001 {
  controllerSource: RichEditorStyledStringController = new RichEditorStyledStringController();
  optionsSource: RichEditorStyledStringOptions = { controller: this.controllerSource };
  controllerTarget: RichEditorController = new RichEditorController();
  optionsTarget: RichEditorOptions = { controller: this.controllerTarget };
  fontStyle: TextStyle = new TextStyle({
    fontColor: Color.Red,
    fontSize: LengthMetrics.vp(20)
  });
  mutableStyledString: MutableStyledString = new MutableStyledString(
    '=========  属性字符串的测试内容  =========\n' +
      '=========  属性字符串的测试内容  =========\n' +
      '=========  属性字符串的测试内容  =========\n',
    [{
      start: -1,
      length: -1,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle
    }]
  );

  aboutToAppear(): void {
    this.controllerSource.setStyledString(this.mutableStyledString);
    this.controllerTarget.addTextSpan('目标编辑器（非属性字符串）', {
      style: {
        fontSize: 16
      }
    });
  }

  build() {
    Column({ space: 10 }) {
      Text('属性字符串组件拖拽到非属性字符串组件')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5, bottom: 5 })

      Text('源组件（属性字符串，拖拽到下方）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsSource)
        .id('rich_editor_copy_paste_attribute_strings_0001_source')
        .width('100%')
        .height(120)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .draggable(true)
        .onDragStart((event: DragEvent) => {
          hilog.info(0x0000, 'TEST', '开始拖拽属性字符串');
        })
        .margin({ bottom: 15 })

      Text('目标组件（非属性字符串，拖拽到此处）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsTarget)
        .id('rich_editor_copy_paste_attribute_strings_0001_target')
        .width('100%')
        .height(120)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Red })
        .borderRadius(8)
        .padding(8)
        .onDrop((event: DragEvent) => {
          this.onDropIntoEditor(event);
        })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }

  private getAttributeStringData(): string {
    const styledString = this.controllerSource.getStyledString();
    return styledString.toString();
  }

  private onDropIntoEditor(event: DragEvent) {
    try {
      // 获取属性字符串数据并转换为spans添加到目标组件
      const attributeStringData = this.getAttributeStringData();

      if (attributeStringData) {
        // 将属性字符串转换为spans添加到目标组件
        this.controllerTarget.addTextSpan(attributeStringData, {
          style: {
            fontSize: 16,
            fontColor: Color.Black
          }
        });

        hilog.info(0x0000, 'TEST', '属性字符串成功转换为span添加到目标组件：' + attributeStringData);
      } else {
        hilog.warn(0x0000, 'TEST', '属性字符串数据为空');
      }
    } catch (err) {
      hilog.error(0x0000, 'TEST', '处理拖拽数据失败：' + (err as Error).message);
    }
  }
}