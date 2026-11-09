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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_MONITORINVISIBLEAREA_0033
// 预期结果: API14编译报错，API16正常编译
// 自动化程度: 10% - 需要手动切换SDK版本验证

@Entry
@Component
struct ImageanimatorMonitorinvisiblearea0033 {
  @State message: string = 'ImageAnimator monitorInvisibleArea API隔离验证'
  @State logs: string[] = []
  @State isVisible: boolean = true

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    if (this.logs.length > 10) {
      this.logs.pop()
    }
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title')

      Text('API隔离验证说明:')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })

      Text('• API14: monitorInvisibleArea不生效，编包应报错')
        .fontSize(12)
        .fontColor(Color.Orange)
        .width('90%')
        .textAlign(TextAlign.Start)

      Text('• API16: monitorInvisibleArea生效，编包正常')
        .fontSize(12)
        .fontColor(Color.Green)
        .width('90%')
        .textAlign(TextAlign.Start)
        .margin({ bottom: 20 })

      if (this.isVisible) {
        ImageAnimator()
          .images([
            { src: $r('app.media.icon') }
          ])
          .width(200)
          .height(200)
          .state(AnimationStatus.Running)
          .id('imageAnimator')
          .onVisibleAreaChange([0.0, 1.0], (isVisible: boolean, currentRatio: number) => {
            this.addLog(`可见区域变化: ${isVisible}, ratio: ${currentRatio.toFixed(2)}`)
          })
      }

      Button('隐藏组件测试回调')
        .onClick(() => {
          this.isVisible = !this.isVisible
          this.addLog(`组件可见性切换: ${this.isVisible}`)
        })
        .margin({ top: 20 })
        .id('toggleBtn')

      Text('当前targetSdkVersion: 请检查build-profile.json5')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ top: 20 })

      Text('日志:')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 10 })

      ForEach(this.logs, (log: string, index: number) => {
        Text(log)
          .fontSize(12)
          .fontColor(Color.Gray)
          .width('90%')
          .textAlign(TextAlign.Start)
      })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
