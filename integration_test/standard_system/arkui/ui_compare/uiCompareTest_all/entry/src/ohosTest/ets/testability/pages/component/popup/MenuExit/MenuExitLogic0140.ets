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

/**
 * 用例ID: ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0140
 * 用例描述: bindContextMenu设置isShown，content（CustomBuilder有3个菜单），enableArrow（true）的菜单退出逻辑
 * （TouchOutSide点击窗口外退出（只适用于子窗类型的菜单）：点击状态栏，导航条）
 * 测试步骤:
 * 1. 点击'默认双描边4'按钮
 * 2. 点击状态栏
 * 3. 同1
 * 4. 点击导航条
 * 预期结果:
 * 1. 菜单弹出
 * 2. 菜单正常关闭
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct MenuExitLogic0140 {
  @Local testLog: string[] = [];

  @Builder
  MyContextMenu() {
    Column() {
      Text(`菜单项1`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuExitLogic0140_MenuItem1')
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0140', `菜单项1点击`);
          this.addLog(`菜单项1点击`);
        })

      Divider()

      Text(`菜单项2`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuExitLogic0140_MenuItem2')
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0140', `菜单项2点击`);
          this.addLog(`菜单项2点击`);
        })

      Divider()

      Text(`菜单项3`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuExitLogic0140_MenuItem3')
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0140', `菜单项3点击`);
          this.addLog(`菜单项3点击`);
        })
    }
    .padding(10)
    .backgroundColor(Color.White)
    .borderRadius(8)
  }

  addLog(log: string): void {
    this.testLog.unshift(`[${new Date().toLocaleTimeString()}] ${log}`);
    if (this.testLog.length > 10) {
      this.testLog = this.testLog.slice(0, 10);
    }
  }

  build() {
    Column({ space: 20 }) {
      Text(`bindContextMenu TouchOutSide测试`)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Text(`测试条件：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Text(`• bindContextMenu设置enableArrow\n• CustomBuilder有3个菜单\n• enableArrow: true\n• 测试点击状态栏和导航条`)
        .fontSize(14)
        .fontColor('#666666')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 40 })

      Text(`测试步骤：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Text(`自动化测试：\n1. 长按下方按钮打开上下文菜单\n\n手动测试：\n2. 打开菜单后点击屏幕顶部状态栏\n3. 观察菜单是否关闭\n4. 再次打开菜单，点击底部导航条\n5. 观察菜单是否关闭`)
        .fontSize(14)
        .fontColor('#666666')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 40 })

      Divider().height(2).color('#EEEEEE')

      Button(`默认双描边4`)
        .fontSize(16)
        .backgroundColor(Color.Blue)
        .bindContextMenu(this.MyContextMenu, ResponseType.LongPress, {
          enableArrow: true
        })
        .onTouch((event: TouchEvent) => {
          if (event.type === TouchType.Down) {
            hilog.info(0x0000, 'MenuExitLogic0140', `按钮长按，打开菜单`);
            this.addLog(`长按打开菜单`);
          }
        })
        .id('MenuExitLogic0140_ContextMenuButton')

      Divider().height(2).color('#EEEEEE')

      Text(`预期结果：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Text(`• 长按按钮后菜单弹出\n• 点击状态栏后菜单关闭\n• 点击导航条后菜单关闭`)
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 40 })

      Text(`注意：`)
        .fontSize(16)
        .fontColor(Color.Red)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Text(`• 状态栏和导航条点击无法自动化\n• 需要手动测试验证`)
        .fontSize(14)
        .fontColor(Color.Red)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 40 })

      Divider().height(2).color('#EEEEEE')

      Text(`测试日志：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(12)
              .fontColor('#333333')
              .width('100%')
              .padding(5)
              .backgroundColor(index % 2 === 0 ? '#F0F0F0' : Color.White)
          })
        }
        .width('100%')
      }
      .height('9.84%')
      .width('90%')
      .backgroundColor('#FAFAFA')
      .borderRadius(4)
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}

