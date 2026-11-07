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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_PC_Event_0034
// 预期结果: TextTimer组件对触控板操作无响应效果
// 自动化程度: 20% - 需要手动触控板操作验证

@Entry
@Component
struct PcEvent0034 {
  @State message: string = 'TextTimer组件触控板操作事件'
  @State logs: string[] = []
  @State textTimerValue: number = 0
  private textTimerController: TextTimerController = new TextTimerController()

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    if (this.logs.length > 20) {
      this.logs.pop()
    }
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .id('title')

      Text('预期: 触控板操作无响应效果')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Text('触控板操作列表:')
        .fontSize(11)
        .fontColor(Color.Orange)
        .width('90%')
        .textAlign(TextAlign.Start)

      Text('悬停、点击、双击、三击、双指轻点、单指按压组件右下角、光标移动、双指上下左右滑动、单指按压拖拽、一指按压一指移动、双指捏合/张开、三指上下滑、三指上滑并停顿、四指左右滑')
        .fontSize(10)
        .fontColor(Color.Gray)
        .width('90%')
        .textAlign(TextAlign.Start)
        .margin({ bottom: 20 })

      TextTimer({ controller: this.textTimerController })
        .format('mm:ss.SS')
        .fontSize(40)
        .fontColor(Color.Black)
        .width(200)
        .height(80)
        .backgroundColor('#E0E0E0')
        .id('textTimer')
        .onTimer((utc: number, elapsedTime: number) => {
          this.textTimerValue = elapsedTime
        })
        .onTouch((event: TouchEvent) => {
          this.addLog(`Touch事件: type=${event.type}`)
        })
        .onMouse((event: MouseEvent) => {
          if (event.action !== MouseAction.Move) {
            this.addLog(`Mouse事件: action=${event.action}`)
          }
        })
        .onHover((isHover: boolean) => {
          this.addLog(`Hover: ${isHover}`)
        })

      Row({ space: 20 }) {
        Button('开始')
          .onClick(() => {
            this.textTimerController.start()
            this.addLog('计时器开始')
          })
          .id('startBtn')

        Button('暂停')
          .onClick(() => {
            this.textTimerController.pause()
            this.addLog('计时器暂停')
          })
          .id('pauseBtn')

        Button('重置')
          .onClick(() => {
            this.textTimerController.reset()
            this.addLog('计时器重置')
          })
          .id('resetBtn')
      }
      .margin({ top: 20, bottom: 20 })

      Text('日志 (记录触控板操作):')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .textAlign(TextAlign.Start)

      Scroll() {
        Column() {
          ForEach(this.logs, (log: string, index: number) => {
            Text(log)
              .fontSize(10)
              .fontColor(Color.Gray)
              .width('100%')
              .textAlign(TextAlign.Start)
          })
        }
        .width('100%')
      }
      .width('90%')
      .height('12.3%')
      .backgroundColor('#F5F5F5')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
