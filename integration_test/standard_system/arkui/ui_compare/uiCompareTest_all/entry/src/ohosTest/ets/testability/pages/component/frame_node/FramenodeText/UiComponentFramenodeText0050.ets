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

class MarqueeNodeController extends NodeController {
  private rootNode: FrameNode | null = null
  private marqueeNode: FrameNode | null = null
  private marqueeText: string = '这是一段跑马灯文本内容，用于测试MarqueeUpdateStrategy.DEFAULT策略效果'

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext)
    
    // 创建 Marquee 组件
    this.marqueeNode = new FrameNode(uiContext)
    this.marqueeNode.commonAttribute
      .width('100%')
      .height(50)
      .backgroundColor(Color.White)
      .borderRadius(8)
    
    if (this.rootNode !== null && this.marqueeNode !== null) {
      this.rootNode.appendChild(this.marqueeNode)
    }
    
    return this.rootNode
  }

  updateMarqueeText(newText: string) {
    this.marqueeText = newText
  }

  getMarqueeText(): string {
    return this.marqueeText
  }
}

@Entry
@Component
struct UiComponentFramenodeText0050 {
  private marqueeController: MarqueeNodeController = new MarqueeNodeController()
  @State start: boolean = true
  @State step: number = 6
  @State loop: number = -1
  @State fromStart: boolean = true
  @State marqueeText: string = '这是一段跑马灯文本内容，用于测试MarqueeUpdateStrategy.DEFAULT策略效果'
  @State currentText: string = this.marqueeText

  infoShowController: RichEditorController = new RichEditorController()
  infoShowOptions: RichEditorOptions = { controller: this.infoShowController }

  aboutToAppear() {
    this.infoShowController.addTextSpan('页面加载完成，Marquee组件已创建\n', {
      style: {
        fontColor: Color.Green,
        fontSize: 14
      }
    })
    this.infoShowController.addTextSpan('MarqueeUpdateStrategy已设置为DEFAULT\n', {
      style: {
        fontColor: Color.Blue,
        fontSize: 14
      }
    })
  }

  build() {
    Column() {
      Text('测试：Marquee组件，设置跑马灯策略为DEFAULT')
        .fontSize(16)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      // 使用 Marquee 组件（标准组件，非FrameNode）
      Marquee({
        start: this.start,
        step: this.step,
        loop: this.loop,
        fromStart: this.fromStart,
        src: this.currentText
      })
        .id('marquee_framenode_text_0050')
        .width('90%')
        .height(50)
        .fontSize(16)
        .fontColor(Color.Black)
        .backgroundColor(Color.White)
        .border({
          width: 2,
          color: Color.Red
        })
        .borderRadius(8)
        .margin(10)
        .marqueeUpdateStrategy(MarqueeUpdateStrategy.DEFAULT)

      Text('信息显示区域：')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5, bottom: 5 })

      RichEditor(this.infoShowOptions)
        .id('info_show_framenode_text_0050')
        .width('90%')
        .height(150)
        .backgroundColor('#FFE4E1')
        .border({
          width: 2,
          color: Color.Red
        })
        .borderRadius(8)
        .padding(8)
        .margin(10)

      Button('修改跑马灯文本内容')
        .id('button_framenode_text_0050_modify')
        .borderRadius(8)
        .width('80%')
        .height(40)
        .margin({ top: 10 })
        .backgroundColor(Color.Red)
        .onClick(() => {
          // 修改 Marquee 组件中的文字内容
          this.currentText = '新的跑马灯文本内容已更新，测试DEFAULT策略是否重置滚动位置并重新启动滚动'
          this.infoShowController.addTextSpan('已修改跑马灯文本内容\n', {
            style: {
              fontColor: Color.Red,
              fontSize: 14,
              fontWeight: FontWeight.Bold
            }
          })
          this.infoShowController.addTextSpan('新文本：' + this.currentText + '\n', {
            style: {
              fontColor: Color.Orange,
              fontSize: 14
            }
          })
          this.infoShowController.addTextSpan('预期效果：重置滚动位置，并重新启动滚动\n', {
            style: {
              fontColor: Color.Green,
              fontSize: 14
            }
          })
        })

      Button('启动/停止滚动')
        .id('button_framenode_text_0050_toggle')
        .borderRadius(8)
        .width('80%')
        .height(40)
        .margin({ top: 10 })
        .backgroundColor(Color.Orange)
        .onClick(() => {
          this.start = !this.start
          this.infoShowController.addTextSpan('滚动状态切换：' + (this.start ? '启动' : '停止') + '\n', {
            style: {
              fontColor: Color.Blue,
              fontSize: 14
            }
          })
        })

      Button('清空信息显示')
        .id('button_framenode_text_0050_clear')
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

