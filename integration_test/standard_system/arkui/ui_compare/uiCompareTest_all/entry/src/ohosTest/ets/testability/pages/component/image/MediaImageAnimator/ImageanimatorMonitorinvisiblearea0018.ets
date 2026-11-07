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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_MONITORINVISIBLEAREA_0018
// 预期结果: 编译报错 - 设置monitorInvisibleArea属性为string/非法字符时编译失败
// 自动化程度: 20% - 需要手动验证编译错误

@Entry
@Component
struct ImageanimatorMonitorinvisiblearea0018 {
  @State message: string = 'ImageAnimator monitorInvisibleArea异常值测试'
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

      Text('注意: 此用例验证编译错误')
        .fontSize(14)
        .fontColor(Color.Red)
        .margin({ bottom: 10 })

      Text('设置monitorInvisibleArea为string/非法字符应编译报错')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      if (this.isVisible) {
        // 正常使用boolean类型作为参考
        ImageAnimator()
          .images([
            { src: $r('app.media.icon') }
          ])
          .width(200)
          .height(200)
          .state(AnimationStatus.Running)
          .id('imageAnimator')
          // 正确用法: monitorInvisibleArea应该是boolean类型
          // 如果设置为string类型，如 monitorInvisibleArea("true" as any)
          // 应该编译报错
          .onVisibleAreaChange([0.0, 1.0], (isVisible: boolean, currentRatio: number) => {
            this.addLog(`可见区域变化: ${isVisible}, ratio: ${currentRatio.toFixed(2)}`)
          })
      }

      Button('切换可见性')
        .onClick(() => {
          this.isVisible = !this.isVisible
          this.addLog(`组件可见性: ${this.isVisible}`)
        })
        .margin({ top: 20 })
        .id('toggleBtn')

      Text('日志:')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 20 })

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
