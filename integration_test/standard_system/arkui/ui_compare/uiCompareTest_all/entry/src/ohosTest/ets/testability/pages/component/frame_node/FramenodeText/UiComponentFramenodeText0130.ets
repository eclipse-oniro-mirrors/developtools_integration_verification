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

import { NodeController, FrameNode } from '@kit.ArkUI'

class TextAreaNodeController extends NodeController {
  private rootNode: FrameNode | null = null
  private textAreaNode: FrameNode | null = null

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext)
    
    // 创建 TextArea 组件
    this.textAreaNode = new FrameNode(uiContext)
    this.textAreaNode.commonAttribute
      .width('100%')
      .height(150)
      .backgroundColor(Color.White)
      .borderRadius(8)
    
    if (this.rootNode !== null && this.textAreaNode !== null) {
      this.rootNode.appendChild(this.textAreaNode)
    }
    
    return this.rootNode
  }
}

@Entry
@Component
struct UiComponentFramenodeText0130 {
  private textAreaController: TextAreaNodeController = new TextAreaNodeController()
  @State text: string = ''
  @State placeholder: string = 'The text area can hold an unlimited amount of text. input your word...'
  @State currentLength: number = 0
  areaController: TextAreaController = new TextAreaController()
  
  infoShowController: RichEditorController = new RichEditorController()
  infoShowOptions: RichEditorOptions = { controller: this.infoShowController }

  aboutToAppear() {
    this.infoShowController.addTextSpan('页面加载完成，TextArea组件已创建\n', {
      style: {
        fontColor: Color.Green,
        fontSize: 14
      }
    })
    this.infoShowController.addTextSpan('maxLength已设置为12个字符\n', {
      style: {
        fontColor: Color.Blue,
        fontSize: 14
      }
    })
  }

  build() {
    Column() {
      Text('测试：TextArea组件，设置文本最大长度')
        .fontSize(16)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('当前字符数：' + this.currentLength + ' / 12')
        .fontSize(14)
        .fontColor(this.currentLength >= 12 ? Color.Red : Color.Blue)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5, bottom: 5 })

      // TextArea 组件 - 最大长度12
      TextArea({
        text: this.text,
        placeholder: this.placeholder,
        controller: this.areaController
      })
        .id('textarea_framenode_text_0130')
        .width('90%')
        .height(150)
        .backgroundColor(Color.White)
        .border({
          width: 2,
          color: Color.Red
        })
        .borderRadius(8)
        .padding(8)
        .margin(10)
        .maxLength(12)
        .onChange((value: string) => {
          this.currentLength = value.length
          this.text = value
          this.infoShowController.addTextSpan('当前输入：' + value + '（长度：' + value.length + '）\n', {
            style: {
              fontColor: value.length >= 12 ? Color.Red : Color.Black,
              fontSize: 14
            }
          })
          if (value.length >= 12) {
            this.infoShowController.addTextSpan('已达到最大长度限制12个字符\n', {
              style: {
                fontColor: Color.Red,
                fontSize: 14,
                fontWeight: FontWeight.Bold
              }
            })
          }
        })

      Text('信息显示区域：')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5, bottom: 5 })

      RichEditor(this.infoShowOptions)
        .id('info_show_framenode_text_0130')
        .width('90%')
        .height(180)
        .backgroundColor('#FFE4E1')
        .border({
          width: 2,
          color: Color.Red
        })
        .borderRadius(8)
        .padding(8)
        .margin(10)

      Button('输入12个字符')
        .id('button_framenode_text_0130_input12')
        .borderRadius(8)
        .width('80%')
        .height(40)
        .margin({ top: 10 })
        .backgroundColor(Color.Red)
        .onClick(() => {
          this.text = '十二个字符测试内容'
          this.currentLength = this.text.length
          this.infoShowController.addTextSpan('已输入12个字符：' + this.text + '\n', {
            style: {
              fontColor: Color.Red,
              fontSize: 14,
              fontWeight: FontWeight.Bold
            }
          })
        })

      Button('尝试输入超过12个字符')
        .id('button_framenode_text_0130_input_more')
        .borderRadius(8)
        .width('80%')
        .height(40)
        .margin({ top: 10 })
        .backgroundColor(Color.Orange)
        .onClick(() => {
          // 尝试输入超过12个字符，但会被maxLength限制
          let longText = '这是一段超过十二个字符的长文本内容'
          this.text = longText
          // 由于maxLength限制，实际只会显示前12个字符
          this.infoShowController.addTextSpan('尝试输入：' + longText + '（长度：' + longText.length + '）\n', {
            style: {
              fontColor: Color.Orange,
              fontSize: 14
            }
          })
          this.infoShowController.addTextSpan('实际输入受maxLength(12)限制\n', {
            style: {
              fontColor: Color.Blue,
              fontSize: 14
            }
          })
        })

      Button('清空信息显示')
        .id('button_framenode_text_0130_clear')
        .borderRadius(8)
        .width('80%')
        .height(40)
        .margin({ top: 10 })
        .backgroundColor(Color.Gray)
        .onClick(() => {
          this.infoShowController.deleteSpans()
        })
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#f5f5f5')
  }
}

