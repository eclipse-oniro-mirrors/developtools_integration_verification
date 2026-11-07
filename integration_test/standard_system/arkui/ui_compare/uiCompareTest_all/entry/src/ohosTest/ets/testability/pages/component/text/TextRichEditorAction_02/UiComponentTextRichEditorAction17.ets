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

@Entry
@Component
struct UiComponentTextRichEditorAction17 {
  controller: RichEditorController = new RichEditorController();

  @State statusInfo: string = '测试流程：1.输入内容 → 2.点击按钮执行三步操作'
  @State operationInfo: string = '等待执行操作'
  @State currentStep: string = '准备阶段'
  @State operationCount: number = 0
  @State hasContent: boolean = false

  build() {
    Column() {
      Column({ space: 8 }) {
        Text(this.statusInfo)
          .fontSize(12)
          .fontColor(Color.Blue)
          .backgroundColor(0xE3F2FD)
          .padding(8)
          .border({ width: 1, color: Color.Blue, radius: 6 })
          .width('100%')
          .textAlign(TextAlign.Center)

        Row({ space: 10 }) {
          Text(this.currentStep)
            .fontSize(11)
            .fontColor(0x666666)
            .backgroundColor(0xF5F5F5)
            .padding(6)
            .borderRadius(4)
            .flexGrow(1)
            .textAlign(TextAlign.Center)

          Text(`操作次数: ${this.operationCount}`)
            .fontSize(11)
            .fontColor(0x666666)
            .backgroundColor(0xF5F5F5)
            .padding(6)
            .borderRadius(4)
            .flexGrow(1)
            .textAlign(TextAlign.Center)
        }
        .width('100%')

        Text(this.operationInfo)
          .fontSize(11)
          .fontColor(Color.Green)
          .backgroundColor(0xE8F5E8)
          .padding(6)
          .border({ width: 1, color: Color.Green, radius: 4 })
          .width('100%')
          .textAlign(TextAlign.Center)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('90%')
      .margin({ bottom: 15 })

      Row({ space: 12 }) {
        Button('添加初始内容')
          .fontSize(11)
          .height(35)
          .backgroundColor(0x4CAF50)
          .fontColor(Color.White)
          .borderRadius(6)
          .id('UiComponentTextRichEditorAction17_01')
          .flexGrow(1)
          .onClick(() => {
            this.addInitialContent()
          })

        Button('执行三步操作')
          .fontSize(11)
          .height(35)
          .backgroundColor(0xFF9800)
          .fontColor(Color.White)
          .borderRadius(6)
          .flexGrow(1)
          .id('UiComponentTextRichEditorAction17_OperateBtn')
          .enabled(this.hasContent)
          .onClick(() => {
            this.executeThreeStepOperations()
          })

        Button('重置测试')
          .fontSize(11)
          .height(35)
          .backgroundColor(0x9C27B0)
          .fontColor(Color.White)
          .borderRadius(6)
          .flexGrow(1)
          .onClick(() => {
            this.resetTest()
          })
      }
      .width('90%')
      .margin({ bottom: 15 })

      Column() {
        Text('编辑器内容区域（支持输入和span操作）')
          .fontSize(12)
          .fontColor(0x333333)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 8 })

        RichEditor({ controller: this.controller })
          .id('UiComponentTextRichEditorAction17_Editor')
          .onReady(() => {
            this.statusInfo = '编辑器已准备就绪，请先添加初始内容'
            console.log('RichEditor已准备就绪')
          })
          .onIMEInputComplete((value: RichEditorTextSpanResult) => {
            this.hasContent = true
            this.currentStep = '已输入内容'
            this.statusInfo = '内容输入完成，可以执行三步操作'
            console.log('输入完成:', value.value)
          })
          .aboutToIMEInput((value: RichEditorInsertValue) => {
            this.currentStep = '正在输入...'
            console.log('即将输入:', value.insertValue)
            return true
          })
          .placeholder('请在此输入测试内容，或点击按钮添加初始内容', {
            fontColor: Color.Gray,
            font: {
              size: 14,
              weight: FontWeight.Normal,
              style: FontStyle.Normal
            }
          })
          .borderWidth(2)
          .borderColor(Color.Blue)
          .borderRadius(8)
          .width('100%')
          .height(120)
          .padding(10)
          .backgroundColor(Color.White)
      }
      .width('90%')
      .margin({ bottom: 15 })

      Text('测试流程说明：\n1. 在编辑器中输入内容或点击「添加初始内容」\n2. 点击「执行三步操作」按钮\n3. 系统将依次执行：指定索引位置添加内容 → 删除指定区间内容 → 指定索引位置添加内容')
        .fontSize(10)
        .fontColor(0x888888)
        .textAlign(TextAlign.Start)
        .width('90%')
        .lineHeight(14)
        .backgroundColor(0xFAFAFA)
        .padding(8)
        .borderRadius(6)

    }
    .width('100%')
    .height('100%')
    .padding(15)
    .justifyContent(FlexAlign.Start)
    .backgroundColor(0xF9F9F9)
  }

  private addInitialContent() {
    try {
      this.controller.deleteSpans({ start: 0, end: -1 })
      this.controller.addTextSpan('这是初始文本内容，', {
        style: {
          fontColor: Color.Black,
          fontSize: 16,
          fontWeight: FontWeight.Normal
        }
      })
      this.controller.addTextSpan('用于测试span操作。', {
        style: {
          fontColor: Color.Blue,
          fontSize: 16,
          fontWeight: FontWeight.Medium
        }
      })
      this.controller.addTextSpan('包含多个文本片段。', {
        style: {
          fontColor: Color.Green,
          fontSize: 16,
          fontWeight: FontWeight.Bold
        }
      })

      this.hasContent = true
      this.currentStep = '已添加初始内容'
      this.statusInfo = '初始内容已添加，现在可以执行三步操作'
      console.log('初始内容添加完成')
    } catch (error) {
      this.statusInfo = `添加初始内容失败: ${error}`
      console.error('添加初始内容失败:', error)
    }
  }

  private executeThreeStepOperations() {
    try {
      this.operationCount++
      this.currentStep = '执行中...'
      this.operationInfo = '步骤1: 在索引位置5添加内容'
      this.controller.addTextSpan('【插入文本1】', {
        offset: 5,
        style: {
          fontColor: Color.Red,
          fontSize: 16,
          fontWeight: FontWeight.Bold,
          decoration: { type: TextDecorationType.Underline, color: Color.Red }
        }
      })
      setTimeout(() => {
        try {
          this.operationInfo = '步骤2: 删除索引8-15区间内容'
          this.controller.deleteSpans({ start: 8, end: 15 })
          setTimeout(() => {
            try {
              this.operationInfo = '步骤3: 在索引位置8添加新内容'
              this.controller.addTextSpan('【插入文本2】', {
                offset: 8,
                style: {
                  fontColor: Color.Orange,
                  fontSize: 16,
                  fontWeight: FontWeight.Bold,
                  decoration: { type: TextDecorationType.LineThrough, color: Color.Orange }
                }
              })

              this.currentStep = '三步操作完成'
              this.operationInfo = `三步操作完成 (第${this.operationCount}次) - 添加→删除→添加`
              this.statusInfo = '所有操作执行完成，可以重复测试或重置'
              console.log(`第${this.operationCount}次三步操作执行完成`)
            } catch (error) {
              this.operationInfo = `步骤3失败: ${error}`
              console.error('步骤3执行失败:', error)
            }
          }, 800)
        } catch (error) {
          this.operationInfo = `步骤2失败: ${error}`
          console.error('步骤2执行失败:', error)
        }
      }, 800)

    } catch (error) {
      this.operationInfo = `步骤1失败: ${error}`
      this.currentStep = '操作失败'
      console.error('步骤1执行失败:', error)
    }
  }

  private resetTest() {
    try {
      this.controller.deleteSpans({ start: 0, end: -1 })
      this.operationCount = 0
      this.hasContent = false
      this.currentStep = '准备阶段'
      this.operationInfo = '等待执行操作'
      this.statusInfo = '测试已重置，请重新添加内容'
      console.log('测试状态已重置')
    } catch (error) {
      this.statusInfo = `重置失败: ${error}`
      console.error('重置失败:', error)
    }
  }
}
