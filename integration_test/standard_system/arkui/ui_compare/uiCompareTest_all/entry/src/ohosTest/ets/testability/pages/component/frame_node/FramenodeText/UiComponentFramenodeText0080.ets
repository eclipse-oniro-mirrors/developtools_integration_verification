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
struct UiComponentFramenodeText0080 {
  private textAreaController: TextAreaNodeController = new TextAreaNodeController()
  @State text: string = ''
  @State placeholder: string = 'The text area can hold an unlimited amount of text. input your word...'
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
    this.infoShowController.addTextSpan('placeholderFont已设置：size: 20, weight: 15, style: Normal/Italic\n', {
      style: {
        fontColor: Color.Blue,
        fontSize: 14
      }
    })
  }

  build() {
    Column() {
      Text('测试：TextArea组件，设置提示文本样式')
        .fontSize(16)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('TextArea - Normal样式')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5, bottom: 5 })

      // TextArea 组件 - Normal样式
      TextArea({
        text: this.text,
        placeholder: this.placeholder,
        controller: this.areaController
      })
        .id('textarea_framenode_text_0080_normal')
        .width('90%')
        .height(120)
        .backgroundColor(Color.White)
        .border({
          width: 2,
          color: Color.Red
        })
        .borderRadius(8)
        .padding(8)
        .margin(10)
        .placeholderFont({ size: 20, weight: 400, style: FontStyle.Normal })
        .placeholderColor('#999999')

      Text('TextArea - Italic样式')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5, bottom: 5 })

      // TextArea 组件 - Italic样式
      TextArea({
        text: this.text,
        placeholder: this.placeholder,
        controller: this.areaController
      })
        .id('textarea_framenode_text_0080_italic')
        .width('90%')
        .height(120)
        .backgroundColor(Color.White)
        .border({
          width: 2,
          color: Color.Blue
        })
        .borderRadius(8)
        .padding(8)
        .margin(10)
        .placeholderFont({ size: 20, weight: 400, style: FontStyle.Italic })
        .placeholderColor('#999999')

      Text('信息显示区域：')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5, bottom: 5 })

      RichEditor(this.infoShowOptions)
        .id('info_show_framenode_text_0080')
        .width('90%')
        .height(100)
        .backgroundColor('#FFE4E1')
        .border({
          width: 2,
          color: Color.Red
        })
        .borderRadius(8)
        .padding(8)
        .margin(10)

      Button('清空信息显示')
        .id('button_framenode_text_0080_clear')
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

