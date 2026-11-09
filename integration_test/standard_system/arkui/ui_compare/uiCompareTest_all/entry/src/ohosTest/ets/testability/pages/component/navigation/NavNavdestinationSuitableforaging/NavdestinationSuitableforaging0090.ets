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

// 测试用例: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_SUITABLEFORAGING_0090
// 预期结果: 适老化适配锁屏与热启动场景，锁屏后/热启动后菜单弹窗正常
// 自动化程度: 15% - 需要手动锁屏和热启动操作

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
export struct NavdestinationSuitableforaging0090 {
  @State message: string = 'NavDestination适老化-锁屏与热启动'
  @State logs: string[] = []
  @State showMenu: boolean = false
  @State currentFontScale: string = '标准'
  @State lockScreenCount: number = 0
  @State hotStartCount: number = 0

  private menuItems: string[] = ['菜单项1', '菜单项2', '菜单项3', '菜单项4', '菜单项5', '菜单项6', '菜单项7']

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    hilog.info(0x0000, 'NavdestinationSuitableforaging0090', log)
    if (this.logs.length > 15) {
      this.logs.pop()
    }
  }

  aboutToAppear() {
    this.addLog('页面加载')
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .id('title')

      Text('测试: 锁屏后/热启动后验证菜单弹窗')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Row({ space: 10 }) {
        Button('1.75x')
          .fontSize(10)
          .onClick(() => {
            this.currentFontScale = '1.75倍'
            this.addLog('特大一档')
          })

        Button('2x')
          .fontSize(10)
          .onClick(() => {
            this.currentFontScale = '2倍'
            this.addLog('特大二档')
          })

        Button('3.2x')
          .fontSize(10)
          .onClick(() => {
            this.currentFontScale = '3.2倍'
            this.addLog('特大三档')
          })
      }
      .margin({ bottom: 10 })

      Row({ space: 20 }) {
        Column() {
          Text('模拟锁屏')
            .fontSize(11)
          Button('🔒')
            .fontSize(16)
            .onClick(() => {
              this.lockScreenCount++
              this.addLog(`模拟锁屏 #${this.lockScreenCount}`)
            })
            .id('lockBtn')
          Text(`${this.lockScreenCount}次`)
            .fontSize(10)
        }

        Column() {
          Text('模拟热启动')
            .fontSize(11)
          Button('🔄')
            .fontSize(16)
            .onClick(() => {
              this.hotStartCount++
              this.addLog(`模拟热启动 #${this.hotStartCount}`)
            })
            .id('hotStartBtn')
          Text(`${this.hotStartCount}次`)
            .fontSize(10)
        }
      }
      .margin({ bottom: 15 })

      // 模拟Navigation菜单区域
      Column() {
        Row() {
          Text('pageOne - 菜单页面')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Blank()
          Button('☰')
            .fontSize(16)
            .onClick(() => {
              this.showMenu = !this.showMenu
              this.addLog('长按菜单按钮')
            })
            .id('menuBtn')
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#E0E0E0')

        if (this.showMenu) {
          Column() {
            Text(`字体: ${this.currentFontScale}`)
              .fontSize(12)
              .fontColor(Color.Blue)
              .margin({ bottom: 10 })

            ForEach(this.menuItems, (item: string, index: number) => {
              Row({ space: 10 }) {
                Image($r('app.media.icon'))
                  .width(24)
                  .height(24)
                Text(item)
                  .fontSize(12)
              }
              .padding(8)
              .width('100%')
              .backgroundColor(index % 2 === 0 ? '#FFFFFF' : '#F5F5F5')
            })

            Button('关闭菜单')
              .fontSize(11)
              .margin({ top: 10 })
              .onClick(() => {
                this.showMenu = false
              })
          }
          .width('70%')
          .backgroundColor(Color.White)
          .shadow({ radius: 10, color: '#33000000' })
          .padding(10)
          .margin({ top: 5 })
        }
      }
      .width('100%')
      .height('20.49%')
      .backgroundColor('#FAFAFA')
      .margin({ top: 10 })
      .id('navigationArea')

      Text('测试步骤:')
        .fontSize(12)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .margin({ top: 10 })

      Text('4. 锁屏后再打开 → 5. 长按菜单')
        .fontSize(10)
        .fontColor(Color.Gray)
        .width('90%')

      Text('6. 上滑退出再返回 → 7. 长按菜单')
        .fontSize(10)
        .fontColor(Color.Gray)
        .width('90%')

      Text('预期: 图片正常，字体按比例放大')
        .fontSize(10)
        .fontColor(Color.Orange)
        .width('90%')

      Scroll() {
        Column() {
          ForEach(this.logs, (log: string) => {
            Text(log)
              .fontSize(9)
              .fontColor(Color.Gray)
          })
        }
      }
      .width('90%')
      .height('4.1%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 5 })
    }
    .width('100%')
    .height('100%')
    .padding(15)
  }
}

