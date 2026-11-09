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
 * XComponent组件，添加通用事件，设置controller、XComponentType为SURFAC
 * SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0590
 */
@Entry
@ComponentV2
export struct UiCustomDrawingGraphicdraw0590 {
  private xComponentController: XComponentController = new XComponentController();
  @Local logs: string[] = [];

  addLog(msg: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.logs.unshift(`[${timestamp}] ${msg}`);
    if (this.logs.length > 15) {
      this.logs = this.logs.slice(0, 15);
    }
  }

  build() {
    Column() {
      Text('XComponent组件，添加通用事件，设置controller、XComponentType为SURFAC')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
        .textAlign(TextAlign.Center)

      Text('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0590')
        .fontSize(10)
        .fontColor('#666')
        .margin({ bottom: 10 })
        .id('btn')

      Text('点击、长按XComponent区域测试通用事件')
        .fontSize(11)
        .margin({ bottom: 5 })

      XComponent({
        id: 'xcomponentId',
        type: XComponentType.SURFACE,
        controller: this.xComponentController,
        libraryname: 'nativerender'
      })
        .width('90%')
        .height(150)
        .backgroundColor('#f0f0f0')
        .border({ width: 2, color: '#FF6B35' })
        .onClick(() => {
          this.addLog('👆 onClick事件触发');
        })
        .onTouch((event) => {
          this.addLog(`👆 onTouch事件: ${event.type}`);
        })
        .onHover((isHover) => {
          this.addLog(`🖱️ onHover事件: ${isHover ? '悬停' : '离开'}`);
        })

      Text('日志信息:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })

      Scroll() {
        Column() {
          ForEach(this.logs, (log: string) => {
            Text(log)
              .fontSize(10)
              .padding(5)
              .width('100%')
              .backgroundColor('#f5f5f5')
              .margin({ bottom: 2 })
          })
        }
        .width('100%')
      }
      .width('90%')
      .height('16.39%')
      .border({ width: 1, color: '#ddd' })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
