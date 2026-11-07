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
 * XComponent组件，添加事件onload和onDestroy，设置cXComponentType为SURFACE
 * SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0570
 */
@Entry
@ComponentV2
export struct UiCustomDrawingGraphicdraw0570 {
  private xComponentController: XComponentController = new XComponentController();
  @Local logs: string[] = [];
  @Local onLoadCount: number = 0;
  @Local onDestroyCount: number = 0;

  addLog(msg: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.logs.unshift(`[${timestamp}] ${msg}`);
    if (this.logs.length > 20) {
      this.logs = this.logs.slice(0, 20);
    }
  }

  build() {
    Column() {
      Text('XComponent组件，添加事件onload和onDestroy，设置cXComponentType为SURFACE')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
        .textAlign(TextAlign.Center)

      Text('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0570')
        .fontSize(10)
        .fontColor('#666')
        .margin({ bottom: 10 })
        .id('btn')

      Text(`onLoad触发: ${this.onLoadCount}次 | onDestroy触发: ${this.onDestroyCount}次`)
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
          this.onLoadCount++;
          this.addLog(`✅ onLoad事件触发 (第${this.onLoadCount}次)`);
        })
        .onDestroy(() => {
          this.onDestroyCount++;
          this.addLog(`⚠️ onDestroy事件触发 (第${this.onDestroyCount}次)`);
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
              .backgroundColor(log.includes('✅') ? '#e8f5e9' : '#fff3e0')
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
