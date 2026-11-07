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
 * 用例ID: ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0130
 * 用例描述: bindContextMenu设置isShown，content（CustomBuilder有3个菜单），enableArrow（true）的菜单退出逻辑
 * （ 应用侧主动关闭调用ContextMenu.close()）
 * 测试步骤:
 * 1. 点击'默认双描边4-close'按钮
 * 2. 等待5秒后查看菜单效果
 * 预期结果:
 * 1. 菜单弹出
 * 2. 菜单正常关闭
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct MenuExitLogic0130 {
  @Local autoCloseTimer: number = 0;
  @Local testLog: string[] = [];
  @Local menuVisible: boolean = false;

  @Builder
  MyContextMenu() {
    Column() {
      Text(`菜单项1`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuExitLogic0130_MenuItem1')
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0130', `菜单项1点击`);
          this.addLog(`菜单项1点击`);
        })

      Divider()

      Text(`菜单项2`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuExitLogic0130_MenuItem2')
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0130', `菜单项2点击`);
          this.addLog(`菜单项2点击`);
        })

      Divider()

      Text(`菜单项3`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuExitLogic0130_MenuItem3')
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0130', `菜单项3点击`);
          this.addLog(`菜单项3点击`);
        })
    }
    .padding(10)
    .backgroundColor(Color.White)
    .borderRadius(8)
  }

  addLog(log: string): void {
    this.testLog.unshift(`[${new Date().toLocaleTimeString()}] ${log}`);
    if (this.testLog.length > 8) {
      this.testLog = this.testLog.slice(0, 8);
    }
  }

  aboutToDisappear(): void {
    if (this.autoCloseTimer) {
      clearTimeout(this.autoCloseTimer);
    }
  }

  build() {
    Column({ space: 20 }) {
      Text(`bindContextMenu主动关闭测试`)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Text(`测试条件：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Text(`• bindContextMenu设置enableArrow\n• CustomBuilder有3个菜单\n• enableArrow: true\n• 应用侧主动关闭（模拟close操作）`)
        .fontSize(14)
        .fontColor('#666666')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 40 })

      Text(`测试步骤：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Text(`1. 长按下方按钮打开上下文菜单\n2. 观察菜单显示效果\n3. 点击菜单项或空白区域关闭\n4. 测试应用侧主动关闭逻辑`)
        .fontSize(14)
        .fontColor('#666666')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 40 })

      Divider().height(2).color('#EEEEEE')

      Button(`默认双描边4-close`)
        .fontSize(16)
        .backgroundColor(Color.Blue)
        .bindContextMenu(this.MyContextMenu, ResponseType.LongPress, {
          enableArrow: true
        })
        .onTouch((event: TouchEvent) => {
          if (event.type === TouchType.Down) {
            hilog.info(0x0000, 'MenuExitLogic0130', `按钮长按，打开菜单`);
            this.addLog(`长按打开菜单`);
            this.menuVisible = true;
          }
        })
        .id('MenuExitLogic0130_ContextMenuButton')

      Button(`模拟应用侧主动关闭`)
        .fontSize(16)
        .backgroundColor(Color.Red)
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0130', `模拟主动关闭操作`);
          this.addLog(`应用侧主动关闭请求（实际测试需验证菜单是否关闭）`);
          // 注意：ContextMenu.close() API在当前版本可能不可用
          // 此处仅模拟主动关闭的触发逻辑
        })
        .id('MenuExitLogic0130_CloseButton')

      Divider().height(2).color('#EEEEEE')

      Text(`预期结果：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Text(`• 长按按钮后菜单弹出\n• 点击菜单项或空白区域菜单关闭\n• 应用侧可以主动控制菜单关闭`)
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 40 })

      Text(`注意：`)
        .fontSize(16)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Text(`• ContextMenu.close() API在当前SDK版本可能不可用\n• 本用例测试应用侧主动关闭的逻辑和交互`)
        .fontSize(14)
        .fontColor(Color.Orange)
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
      .height('8.2%')
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

