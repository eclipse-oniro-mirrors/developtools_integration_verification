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
struct MeasurableUniqueId0070 {
  @State logText: string = '日志输出:\n'

  build() {
    Column() {
      Text('MeasurableUniqueId0070测试页面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('正确获取占位子组件的FrameNode，添加双击手势事件')
        .fontSize(14)
        .margin({ bottom: 20 })

      // 三个粉色方块
      Row() {
        ForEach([0, 1, 2], (index: number) => {
          Column() {
            Text(`方块${index + 1}`)
              .fontSize(14)
              .fontColor(Color.White)
          }
          .id(`node_container_${index}`)
          .width('13.89%')
          .height('8.2%')
          .backgroundColor(Color.Pink)
          .justifyContent(FlexAlign.Center)
          .margin(10)
          .gesture(
            TapGesture({ count: 2, fingers: 1 })
              .onAction((event: GestureEvent) => {
                let actionLog: string = `粉色方块${index} - DoubleTap双击手势触发`
                console.log(actionLog)
                this.logText += actionLog + '\n'
              })
          )
          .gesture(
            TapGesture({ count: 1, fingers: 1 })
              .onAction((event: GestureEvent) => {
                let actionLog: string = `粉色方块${index} - SingleTap单击手势触发`
                console.log(actionLog)
                this.logText += actionLog + '\n'
              })
          )
        })
      }
      .justifyContent(FlexAlign.SpaceEvenly)
      .width('100%')
      .margin({ bottom: 20 })

      Button('添加双击手势事件到占位子组件')
        .id('add_doubletap_gesture_button')
        .onClick(() => {
          this.addDoubleTapGestureToChildFrameNodes()
        })
        .margin({ bottom: 20 })

      // 日志显示区域
      Scroll() {
        Text(this.logText)
          .id('log_text')
          .fontSize(12)
          .fontColor(Color.Black)
          .width('100%')
          .padding(10)
          .backgroundColor(Color.White)
          .border({ width: 1, color: Color.Gray })
      }
      .width('100%')
      .height('24.59%')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#FFFFE0')
  }

  addDoubleTapGestureToChildFrameNodes(): void {
    try {
      // 遍历每个粉色方块，添加双击手势事件
      for (let i = 0; i < 3; i++) {
        let frameNode = this.getUIContext()?.getFrameNodeById(`node_container_${i}`)
        if (frameNode) {
          let uniqueId: number = frameNode.getUniqueId()
          let gestureLog: string = `已为粉色方块${i}添加DoubleTap双击手势事件，UniqueId: ${uniqueId}`
          console.log(gestureLog)
          this.logText += gestureLog + '\n'
        }
      }
    } catch (error) {
      let errorMessage: string = `添加双击手势事件失败: ${error}`
      console.error(errorMessage)
      this.logText += errorMessage + '\n'
    }
  }
}
