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
 * 用例ID: ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0150
 * 用例描述: bindContextMenu设置isShown，content（CustomBuilder有3个菜单），enableArrow（true）的菜单退出逻辑
 * （点击菜单项关闭、点击蒙层空白区域（非菜单区域）、窗口失焦关闭：熄屏、退后台、横竖屏旋转、
 * BackPressed手势退出：左右滑手势、 应用进行路由跳转）
 * 测试步骤:
 * 1. 点击'默认双描边4'按钮打开菜单
 * 2. 测试多种关闭方式（点击菜单项、蒙层、熄屏、后台、旋转、手势、路由跳转）
 * 预期结果: 所有方式都能正确关闭菜单
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
struct MenuExitLogic0150 {
  @Local testLog: string[] = [];

  @Builder
  MyContextMenu() {
    Column() {
      Text(`菜单项1`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuExitLogic0150_MenuItem1')
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0150', `菜单项1点击`);
          this.addLog(`菜单项1点击，菜单应关闭`);
        })

      Divider()

      Text(`菜单项2`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuExitLogic0150_MenuItem2')
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0150', `菜单项2点击`);
          this.addLog(`菜单项2点击，菜单应关闭`);
        })

      Divider()

      Text(`菜单项3`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuExitLogic0150_MenuItem3')
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0150', `菜单项3点击`);
          this.addLog(`菜单项3点击，菜单应关闭`);
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
    Column({ space: 15 }) {
      Text(`bindContextMenu综合退出逻辑测试`)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Text(`测试条件：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Text(`• bindContextMenu设置enableArrow\n• CustomBuilder有3个菜单\n• enableArrow: true`)
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
            hilog.info(0x0000, 'MenuExitLogic0150', `按钮长按，打开菜单`);
            this.addLog(`长按打开菜单`);
          }
        })
        .id('MenuExitLogic0150_ContextMenuButton')

      Button(`路由跳转测试`)
        .fontSize(16)
        .backgroundColor(Color.Green)
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0150', `路由跳转`);
          this.addLog(`路由跳转，菜单应关闭`);
          router.pushUrl({ url: 'testability/pages/component/popup/MenuExit/MenuExitLogic0150' });
        })
        .id('MenuExitLogic0150_RouterButton')

      Divider().height(2).color('#EEEEEE')

      Text(`测试步骤：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Scroll() {
        Text(`自动化可测：\n1. 长按按钮打开菜单\n2. 点击菜单项关闭\n3. 点击蒙层空白区域关闭\n4. 路由跳转\n\n手动测试：\n5. 熄屏后解锁（菜单应关闭）\n6. 双指上移进多任务切换应用（菜单应关闭）\n7. 横竖屏旋转（菜单应关闭）\n8. 左右滑屏幕边缘手势（菜单应关闭）`)
          .fontSize(14)
          .fontColor('#666666')
          .alignSelf(ItemAlign.Start)
          .padding({ left: 40 })
          .maxLines(15)
      }
      .height('11.48%')
      .width('90%')
      .align(Alignment.TopStart)

      Divider().height(2).color('#EEEEEE')

      Text(`预期结果：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Text(`• 所有操作都能正确关闭菜单`)
        .fontSize(14)
        .fontColor(Color.Green)
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

