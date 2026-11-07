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

/**
 * 连续删除、撤销删除、还原删除并通过onwillchange获取文本属性
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0055
 */
@Entry
@ComponentV2
export struct RicheditorInterface0055 {
  controller: RichEditorController = new RichEditorController();
  @Local logText: string = '';
  @Local operationCount: number = 0;

  logOperation(action: string): void {
    this.operationCount++;
    this.logText = `${this.operationCount}. ${action}`;
  }

  build() {
    Scroll() {
      Column() {
        Text('连续删除撤销还原onwillchange测试')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0055')
          .fontSize(11)
          .fontColor('#666')
          .margin({ bottom: 15 })

        Text(`操作日志: ${this.logText}`)
          .fontSize(12)
          .margin({ bottom: 10 })

        RichEditor({ controller: this.controller })
          .width('90%')
          .height(200)
          .border({ width: 1, color: '#ccc' })
          .margin({ bottom: 15 })
          .onWillChange((value: RichEditorChangeValue) => {
            this.logOperation(`onWillChange: 范围[${value.rangeBefore.start},${value.rangeBefore.end}]`);
            return true;
          })

        Row() {
          Button('删除文本')
            .fontSize(12)
            .onClick(() => {
              this.controller.deleteSpans({ start: 0, end: 5 });
              this.logOperation('删除了前5个字符');
            })
            .margin({ right: 5 })

          Button('撤销')
            .fontSize(12)
            .onClick(() => {
              this.logOperation('撤销删除操作');
            })
            .margin({ right: 5 })

          Button('还原')
            .fontSize(12)
            .onClick(() => {
              this.logOperation('还原删除操作');
            })
        }
        .width('90%')
        .margin({ bottom: 15 })

        Button('测试完成')
          .id('btn')
          .width('80%')
          .onClick(() => {})
          .margin({ bottom: 15 })

        Text('测试说明：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('1. 外接键盘删除部分内容\\n2. 撤销删除\\n3. 还原删除\\n4. 重复操作并观察onWillChange回调')
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })

        Text('预期结果：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 5, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('操作无异常，onWillChange回调正确')
          .fontSize(10)
          .fontColor('#FF6B35')
          .width('95%')
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }

  aboutToAppear(): void {
    this.controller.addTextSpan('这是一段测试文本内容，用于测试删除、撤销、还原操作。', {
      style: {
        fontColor: Color.Black,
        fontSize: 14
      }
    });
  }
}

