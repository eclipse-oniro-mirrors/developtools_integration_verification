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
 * 连续调用setselection+updatespanstyle
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0057
 */
@Entry
@ComponentV2
export struct RicheditorInterface0057 {
  controller: RichEditorController = new RichEditorController();
  @Local logText: string = '';
  @Local operationCount: number = 0;

  testMultipleTimes(): void {
    for (let i = 0; i < 5; i++) {
      setTimeout(() => {
        const start = i * 5;
        const end = start + 5;
        
        // 设置选区
        this.controller.setSelection(start, end);
        
        // 更新样式
        this.controller.updateSpanStyle({
          start: start,
          end: end,
          textStyle: {
            fontColor: i % 2 === 0 ? Color.Red : Color.Blue,
            fontSize: 14 + i * 2
          }
        });
        
        // 查询选区
        const selection = this.controller.getSelection();
        this.operationCount++;
        this.logText = `第${this.operationCount}次: 选区[${start},${end}], 查询[${selection.selection[0]},${selection.selection[1]}]`;
      }, i * 500);
    }
  }

  build() {
    Scroll() {
      Column() {
        Text('连续setselection+updatespanstyle测试')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0057')
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

        Row() {
          Button('执行连续操作')
            .fontSize(12)
            .onClick(() => this.testMultipleTimes())
            .margin({ right: 5 })

          Button('重置')
            .fontSize(12)
            .onClick(() => {
              this.operationCount = 0;
              this.logText = '';
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

        Text('1. setSelection选区\\n2. updateSpanStyle更新样式\\n3. getSelection查询\\n4. 连续调用5次')
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })

        Text('预期结果：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 5, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('选区更新符合预期，查询内容对应正确')
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
    this.controller.addTextSpan('这是一段很长的测试文本内容，用于测试连续的选区和样式更新操作。', {
      style: {
        fontColor: Color.Black,
        fontSize: 14
      }
    });
  }
}

