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
 * XComponent组件设置XComponentType为SURFACE，不设置libraryname
 * SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0530
 */
@Entry
@ComponentV2
export struct UiCustomDrawingGraphicdraw0530 {
  private xComponentController: XComponentController = new XComponentController();
  @Local logs: string[] = [];

  addLog(msg: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.logs.unshift(`[${timestamp}] ${msg}`);
    if (this.logs.length > 20) {
      this.logs = this.logs.slice(0, 20);
    }
  }

  aboutToAppear(): void {
    this.addLog('页面即将显示');
  }

  build() {
    Column() {
      Text('XComponent组件设置XComponentType为SURFACE，不设置libraryname')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
        .textAlign(TextAlign.Center)

      Text('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0530')
        .fontSize(12)
        .fontColor('#666')
        .margin({ bottom: 10 })
        .id('btn')

      Text('XComponent区域 (type: SURFACE)')
        .fontSize(12)
        .margin({ bottom: 5 })

      XComponent({
        id: 'xcomponentId',
        type: XComponentType.SURFACE,
        controller: this.xComponentController
      })
        .width('90%')
        .height(200)
        .backgroundColor('#f0f0f0')
        .border({ width: 2, color: '#FF6B35' })
        .margin({ bottom: 10 })

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
      .height('12.3%')
      .border({ width: 1, color: '#ddd' })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
