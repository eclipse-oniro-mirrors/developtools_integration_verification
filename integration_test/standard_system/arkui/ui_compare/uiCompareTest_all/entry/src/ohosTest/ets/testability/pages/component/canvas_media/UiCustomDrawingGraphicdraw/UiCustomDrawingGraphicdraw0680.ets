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
 * XComponent组件，设置controller，XComponentType为SURFACE，使用SurfaceRect方法
 * SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0680
 */
@Entry
@ComponentV2
export struct UiCustomDrawingGraphicdraw0680 {
  private xComponentController: XComponentController = new XComponentController();
  @Local logs: string[] = [];
  @Local rectInfo: string = '';

  addLog(msg: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.logs.unshift(`[${timestamp}] ${msg}`);
    if (this.logs.length > 15) {
      this.logs = this.logs.slice(0, 15);
    }
  }

  getSurfaceRect(): void {
    try {
      const rect = this.xComponentController.getXComponentSurfaceRect();
      this.rectInfo = `宽:${rect.surfaceWidth}, 高:${rect.surfaceHeight}`;
      this.addLog(`✅ 获取SurfaceRect成功: ${this.rectInfo}`);
    } catch (error) {
      this.addLog(`❌ 获取失败: ${JSON.stringify(error)}`);
    }
  }

  build() {
    Column() {
      Text('XComponent组件，设置controller，XComponentType为SURFACE，使用SurfaceRect方法')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })

      Text('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0680')
        .fontSize(10)
        .fontColor('#666')
        .margin({ bottom: 10 })
        .id('btn')

      XComponent({
        id: 'xcomponentId',
        type: XComponentType.SURFACE,
        controller: this.xComponentController,
        libraryname: 'nativerender'
      })
        .width('90%')
        .height(120)
        .backgroundColor('#f0f0f0')
        .border({ width: 2, color: '#FF6B35' })
        .onLoad(() => {
          this.getSurfaceRect();
        })

      Button('获取SurfaceRect')
        .width('80%')
        .margin({ top: 10 })
        .onClick(() => {
          this.getSurfaceRect();
        })

      Text(`当前Rect: ${this.rectInfo || '未获取'}`)
        .fontSize(11)
        .margin({ top: 5 })

      Scroll() {
        Column() {
          ForEach(this.logs, (log: string) => {
            Text(log)
              .fontSize(10)
              .padding(5)
              .width('100%')
              .backgroundColor(log.includes('✅') ? '#e8f5e9' : '#ffebee')
              .margin({ bottom: 2 })
          })
        }
        .width('100%')
      }
      .width('90%')
      .height('12.3%')
      .border({ width: 1, color: '#ddd' })
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
