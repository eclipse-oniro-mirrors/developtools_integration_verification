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
struct UiComponentTextRichEditorCopyPasteAttributeStrings0005 {
  controllerA: RichEditorStyledStringController = new RichEditorStyledStringController();
  optionsA: RichEditorStyledStringOptions = { controller: this.controllerA };
  controllerB: RichEditorStyledStringController = new RichEditorStyledStringController();
  optionsB: RichEditorStyledStringOptions = { controller: this.controllerB };
  fontStyleA: TextStyle = new TextStyle({
    fontColor: Color.Red,
    fontSize: LengthMetrics.vp(20)
  });
  fontStyleB: TextStyle = new TextStyle({
    fontColor: Color.Blue,
    fontSize: LengthMetrics.vp(20)
  });
  mutableStyledStringA: MutableStyledString = new MutableStyledString(
    '========= 属性字符串组件A的内容 =========\n' +
      '========= 属性字符串组件A的内容 =========\n' +
      '========= 属性字符串组件A的内容 =========\n',
    [{
      start: -1,
      length: -1,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyleA
    }]
  );
  mutableStyledStringB: MutableStyledString = new MutableStyledString(
    '========= 属性字符串组件B的内容 =========\n' +
      '========= 属性字符串组件B的内容 =========\n' +
      '========= 属性字符串组件B的内容 =========\n',
    [{
      start: -1,
      length: -1,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyleB
    }]
  );

  aboutToAppear(): void {
    this.controllerA.setStyledString(this.mutableStyledStringA);
    this.controllerB.setStyledString(this.mutableStyledStringB);
  }

  build() {
    Column({ space: 10 }) {
      Text('两个属性字符串组件之间互相拖拽')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('组件A（属性字符串，从此处拖拽）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsA)
        .id('rich_editor_copy_paste_attribute_strings_0005_source')
        .width('100%')
        .height(120)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .draggable(true)
        .onDragStart((event: DragEvent) => {
          hilog.info(0x0000, 'TEST', '开始拖拽属性字符串A');
        })
        .margin({ bottom: 15 })

      Text('组件B（属性字符串，拖拽到此处）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsB)
        .id('rich_editor_copy_paste_attribute_strings_0005_target')
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
    const styledString = this.controllerA.getStyledString();
    return styledString.toString();
  }

  private onDropIntoEditor(event: DragEvent) {
    try {
      // 获取属性字符串数据并转换为属性字符串添加到目标组件
      const attributeStringData = this.getAttributeStringData();

      if (attributeStringData) {
        // 获取目标组件的当前内容，然后添加新的属性字符串
        const currentStyledString = this.controllerB.getStyledString();
        const combinedText = currentStyledString.toString() + attributeStringData;
        const combinedStyledString = new MutableStyledString(combinedText, [{
          start: 0,
          length: combinedText.length,
          styledKey: StyledStringKey.FONT,
          styledValue: this.fontStyleB
        }]);

        this.controllerB.setStyledString(combinedStyledString);

        hilog.info(0x0000, 'TEST', '属性字符串成功添加到目标属性字符串组件：' + attributeStringData);
      } else {
        hilog.warn(0x0000, 'TEST', '属性字符串数据为空');
      }
    } catch (err) {
      hilog.error(0x0000, 'TEST', '处理拖拽数据失败：' + (err as Error).message);
    }
  }
}

