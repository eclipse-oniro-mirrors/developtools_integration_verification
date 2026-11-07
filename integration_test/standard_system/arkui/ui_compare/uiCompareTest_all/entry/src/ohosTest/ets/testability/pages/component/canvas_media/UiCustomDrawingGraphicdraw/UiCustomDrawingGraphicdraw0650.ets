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
 * XComponent组件，设置controller，使用onSurfaceCreated方法
 * SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0650
 */
@Entry
@ComponentV2
export struct UiCustomDrawingGraphicdraw0650 {
  private xComponentController: XComponentController = new XComponentController();
  @Local logs: string[] = [];
  @Local callbackCount: number = 0;

  addLog(msg: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.logs.unshift(`[${timestamp}] ${msg}`);
    if (this.logs.length > 15) {
      this.logs = this.logs.slice(0, 15);
    }
  }

  build() {
    Column() {
      Text('XComponent组件，设置controller，使用onSurfaceCreated方法')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })

      Text('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0650')
        .fontSize(10)
        .fontColor('#666')
        .margin({ bottom: 10 })
        .id('btn')

      Text(`onSurfaceCreated触发次数: ${this.callbackCount}`)
        .fontSize(11)
        .fontColor('#FF6B35')
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
        .onLoad((event) => {
          this.callbackCount++;
          this.addLog(`✅ onSurfaceCreated相关: XComponent加载完成 (第${this.callbackCount}次)`);
        })

      Scroll() {
        Column() {
          ForEach(this.logs, (log: string) => {
            Text(log)
              .fontSize(10)
              .padding(5)
              .width('100%')
              .backgroundColor('#e8f5e9')
              .margin({ bottom: 2 })
          })
        }
        .width('100%')
      }
      .width('90%')
      .height('16.39%')
      .border({ width: 1, color: '#ddd' })
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
