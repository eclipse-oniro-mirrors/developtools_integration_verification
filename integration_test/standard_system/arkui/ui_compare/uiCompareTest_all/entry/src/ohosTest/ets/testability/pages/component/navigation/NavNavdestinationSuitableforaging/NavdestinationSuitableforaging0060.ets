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

// 测试用例: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_SUITABLEFORAGING_0060
// 预期结果: 适老化适配左右滑动场景，左右滑动切换tab，抬手弹出菜单弹窗
// 自动化程度: 20% - 需要手动切换字体大小和滑动操作

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
export struct NavdestinationSuitableforaging0060 {
  @State message: string = 'NavDestination适老化-左右滑动'
  @State logs: string[] = []
  @State showMenu: boolean = false
  @State currentTab: number = 0
  @State currentFontScale: string = '标准'

  private tabs: string[] = ['首页', '分类', '消息', '我的', '设置', '帮助', '关于']

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    hilog.info(0x0000, 'NavdestinationSuitableforaging0060', log)
    if (this.logs.length > 10) {
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

      Text('测试: 左右滑动切换tab，长按弹出菜单')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Row({ space: 10 }) {
        Button('1.75x')
          .fontSize(10)
          .onClick(() => {
            this.currentFontScale = '1.75倍'
            this.addLog('特大一档 1.75倍')
          })

        Button('2x')
          .fontSize(10)
          .onClick(() => {
            this.currentFontScale = '2倍'
            this.addLog('特大二档 2倍')
          })

        Button('3.2x')
          .fontSize(10)
          .onClick(() => {
            this.currentFontScale = '3.2倍'
            this.addLog('特大三档 3.2倍')
          })
      }
      .margin({ bottom: 10 })

      Text(`字体: ${this.currentFontScale} | Tab: ${this.tabs[this.currentTab]}`)
        .fontSize(12)
        .fontColor(Color.Blue)

      // 模拟Navigation带Tab
      Column() {
        // Tab栏
        Row() {
          ForEach(this.tabs, (tab: string, index: number) => {
            Text(tab)
              .fontSize(12)
              .padding({ left: 8, right: 8, top: 5, bottom: 5 })
              .backgroundColor(this.currentTab === index ? '#007DFF' : '#E0E0E0')
              .fontColor(this.currentTab === index ? Color.White : Color.Black)
              .borderRadius(5)
              .onClick(() => {
                this.currentTab = index
                this.addLog(`切换到: ${tab}`)
              })
              .gesture(
                LongPressGesture()
                  .onAction(() => {
                    this.showMenu = true
                    this.addLog(`长按: ${tab}`)
                  })
              )
          })
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#F0F0F0')

        // 内容区
        Column() {
          Text(`${this.tabs[this.currentTab]} 页面内容`)
            .fontSize(16)

          Text('← 左右滑动切换Tab →')
            .fontSize(12)
            .fontColor(Color.Gray)
            .margin({ top: 20 })

          Text('长按Tab弹出菜单')
            .fontSize(12)
            .fontColor(Color.Orange)
            .margin({ top: 10 })
        }
        .width('100%')
        .height('12.3%')
        .justifyContent(FlexAlign.Center)
        .gesture(
          PanGesture()
            .onActionEnd((event: GestureEvent) => {
              if (event.offsetX > 50 && this.currentTab > 0) {
                this.currentTab--
                this.addLog(`左滑: ${this.tabs[this.currentTab]}`)
              } else if (event.offsetX < -50 && this.currentTab < this.tabs.length - 1) {
                this.currentTab++
                this.addLog(`右滑: ${this.tabs[this.currentTab]}`)
              }
            })
        )

        // 菜单弹窗
        if (this.showMenu) {
          Column() {
            Text('菜单弹窗')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .margin({ bottom: 10 })

            Button('关闭')
              .onClick(() => {
                this.showMenu = false
              })
          }
          .width('60%')
          .padding(20)
          .backgroundColor(Color.White)
          .shadow({ radius: 10, color: '#33000000' })
        }
      }
      .width('100%')
      .height('22.95%')
      .backgroundColor('#FAFAFA')
      .margin({ top: 10 })
      .id('navigationArea')

      Text('预期: 左右滑动切换tab，抬手弹出菜单弹窗')
        .fontSize(11)
        .fontColor(Color.Orange)
        .margin({ top: 10 })

      Scroll() {
        Column() {
          ForEach(this.logs, (log: string) => {
            Text(log)
              .fontSize(10)
              .fontColor(Color.Gray)
          })
        }
      }
      .width('90%')
      .height('4.92%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(15)
  }
}

