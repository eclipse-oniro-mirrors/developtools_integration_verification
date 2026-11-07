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
 * 用例ID: ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0110
 * 用例描述: bindMenu设置isShown，content（ CustomBuilder有3个菜单），showInSubWindow（true）,
 * enableArrow（true）的菜单退出逻辑（点击菜单项关闭、点击蒙层空白区域（非菜单区域）、窗口失焦关闭：熄屏、
 * 退后台、横竖屏旋转、BackPressed手势退出：左右滑手势、 应用进行路由跳转、应用主动把isShow改为false）
 * 测试步骤:
 * 1. 点击'默认双描边2'按钮打开菜单
 * 2. 测试多种关闭方式（点击菜单项、蒙层、熄屏、后台、旋转、手势、路由跳转）
 * 3. 测试主动设置isShow为false
 * 预期结果: 所有方式都能正确关闭菜单
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
struct MenuExitLogic0110 {
  @Local isMenuShow: boolean = false;
  @Local menuCloseCount: number = 0;
  @Local testLog: string[] = [];

  @Builder
  MyMenu() {
    Column() {
      Text(`菜单项1`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuExitLogic0110_MenuItem1')
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0110', `菜单项1点击`);
          this.addLog(`菜单项1点击，菜单应关闭`);
          this.isMenuShow = false;
        })

      Divider()

      Text(`菜单项2`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuExitLogic0110_MenuItem2')
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0110', `菜单项2点击`);
          this.addLog(`菜单项2点击，菜单应关闭`);
          this.isMenuShow = false;
        })

      Divider()

      Text(`菜单项3`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuExitLogic0110_MenuItem3')
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0110', `菜单项3点击`);
          this.addLog(`菜单项3点击，菜单应关闭`);
          this.isMenuShow = false;
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
      Text(`bindMenu综合退出逻辑测试`)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Text(`测试条件：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Text(`• bindMenu设置isShown\n• CustomBuilder有3个菜单\n• showInSubWindow: true\n• enableArrow: true`)
        .fontSize(14)
        .fontColor('#666666')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 40 })

      Divider().height(2).color('#EEEEEE')

      Button(`默认双描边2`)
        .fontSize(16)
        .backgroundColor(this.isMenuShow ? Color.Orange : Color.Blue)
        .bindMenu(this.isMenuShow, this.MyMenu, {
          showInSubWindow: true,
          enableArrow: true
        })
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0110', `按钮点击，打开菜单`);
          this.isMenuShow = true;
          this.addLog(`菜单打开`);
        })
        .id('MenuExitLogic0110_OpenButton')

      Button(`默认双描边2-主动关闭isShow`)
        .fontSize(16)
        .backgroundColor(Color.Red)
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0110', `主动关闭isShow`);
          this.isMenuShow = false;
          this.addLog(`主动设置isShow=false，菜单应关闭`);
        })
        .id('MenuExitLogic0110_CloseButton')

      Button(`路由跳转测试`)
        .fontSize(16)
        .backgroundColor(Color.Green)
        .onClick(() => {
          hilog.info(0x0000, 'MenuExitLogic0110', `路由跳转`);
          this.addLog(`路由跳转，菜单应关闭`);
          router.pushUrl({ url: 'testability/pages/component/popup/MenuExit/MenuExitLogic0110' });
        })
        .id('MenuExitLogic0110_RouterButton')

      Divider().height(2).color('#EEEEEE')

      Text(`测试步骤：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Scroll() {
        Text(`自动化可测：\n1. 点击按钮打开菜单\n2. 点击菜单项关闭\n3. 点击蒙层空白区域关闭\n4. 主动设置isShow=false\n5. 路由跳转\n\n手动测试：\n6. 熄屏后解锁（菜单应关闭）\n7. 双指上移进多任务切换应用（菜单应关闭）\n8. 横竖屏旋转（菜单应关闭）\n9. 左右滑屏幕边缘手势（菜单应关闭）`)
          .fontSize(14)
          .fontColor('#666666')
          .alignSelf(ItemAlign.Start)
          .padding({ left: 40 })
          .maxLines(20)
      }
      .height('12.3%')
      .width('90%')
      .align(Alignment.TopStart)

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

