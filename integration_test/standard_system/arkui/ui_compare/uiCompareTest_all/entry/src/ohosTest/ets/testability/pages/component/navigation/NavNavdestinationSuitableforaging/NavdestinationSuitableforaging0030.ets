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

// 测试用例: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_SUITABLEFORAGING_0030
// 预期结果: 适老化适配超长文本场景，菜单弹窗自适应撑高，最大6行后显示...
// 自动化程度: 20% - 需要手动切换系统字体大小验证

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
export struct NavdestinationSuitableforaging0030 {
  @State message: string = 'NavDestination适老化-超长文本'
  @State logs: string[] = []
  @State showMenu: boolean = false
  @State currentFontScale: string = '标准'

  private menuItems: string[] = [
    '这是一个非常长的菜单项文本用于测试超长文本场景下的显示效果',
    '第二个超长菜单项文本内容这里也是很长的一段文字用于验证换行',
    '第三个菜单项',
    '第四个菜单项也是超长文本需要验证在适老化场景下的显示',
    '第五个菜单项测试文本',
    '第六个菜单项',
    '第七个菜单项'
  ]

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    hilog.info(0x0000, 'NavdestinationSuitableforaging0030', log)
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

      Text('测试: 系统切换为特大字体后验证菜单弹窗')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Row({ space: 10 }) {
        Button('特大一档')
          .fontSize(11)
          .onClick(() => {
            this.currentFontScale = '1.75倍'
            this.addLog('模拟: 特大一档 1.75倍')
          })

        Button('特大二档')
          .fontSize(11)
          .onClick(() => {
            this.currentFontScale = '2倍'
            this.addLog('模拟: 特大二档 2倍')
          })

        Button('特大三档')
          .fontSize(11)
          .onClick(() => {
            this.currentFontScale = '3.2倍'
            this.addLog('模拟: 特大三档 3.2倍')
          })
      }
      .margin({ bottom: 15 })

      Text(`当前字体: ${this.currentFontScale}`)
        .fontSize(12)
        .fontColor(Color.Blue)

      // 模拟Navigation菜单区域
      Column() {
        Row() {
          Text('pageTwo - 超长文本页面')
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
            ForEach(this.menuItems, (item: string, index: number) => {
              Text(item)
                .fontSize(12)
                .padding(10)
                .width('100%')
                .backgroundColor(index % 2 === 0 ? '#FFFFFF' : '#F5F5F5')
                .maxLines(6)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            })
          }
          .width('80%')
          .backgroundColor(Color.White)
          .shadow({ radius: 10, color: '#33000000' })
          .margin({ top: 5 })
        }

        Text('页面内容区域')
          .fontSize(14)
          .margin({ top: 50 })
      }
      .width('100%')
      .height('24.59%')
      .backgroundColor('#FAFAFA')
      .margin({ top: 10 })
      .id('navigationArea')

      Text('预期效果:')
        .fontSize(12)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .margin({ top: 15 })

      Text('• 图片正常显示')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('• 字体大小分别为1.75倍、2倍、3.2倍')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('• 菜单弹窗超长自适应撑高，最大6行后...显示')
        .fontSize(11)
        .fontColor(Color.Orange)
        .width('90%')

      Text('日志:')
        .fontSize(12)
        .width('90%')
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
    }
    .width('100%')
    .height('100%')
    .padding(15)
  }
}

