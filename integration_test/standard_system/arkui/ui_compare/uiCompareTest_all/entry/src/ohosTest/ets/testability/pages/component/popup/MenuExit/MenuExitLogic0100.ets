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
 * 用例ID: ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_EXITLOGICOPTIMIZATION_0100
 * 用例描述: bindMenu不设置isShown，content（MenuElement[]有3个菜单），
 * title(HelloWorld)，showInSubWindow（false）,enableArrow（false）的菜单退出逻辑（目标节点销毁）
 * 测试步骤:
 * 1. 点击'默认双描边1-目前节点销毁'按钮
 * 2. 等待5秒后查看菜单效果
 * 预期结果:
 * 1. 菜单弹出
 * 2. 菜单和button都消失
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct MenuExitLogic0100 {
  @Local showButton: boolean = true;
  @Local destroyTimer: number = 0;

  aboutToDisappear(): void {
    if (this.destroyTimer) {
      clearTimeout(this.destroyTimer);
    }
  }

  build() {
    Column({ space: 20 }) {
      Text(`bindMenu目标节点销毁测试`)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Text(`测试条件：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Text(`• bindMenu不设置isShown\n• MenuElement[]有3个菜单\n• title: HelloWorld\n• showInSubWindow: false\n• enableArrow: false`)
        .fontSize(14)
        .fontColor('#666666')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 40 })

      Text(`测试步骤：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Text(`1. 点击下方按钮打开菜单\n2. 等待5秒后button自动销毁\n3. 观察菜单是否同时消失`)
        .fontSize(14)
        .fontColor('#666666')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 40 })

      Divider().height(2).color('#EEEEEE')

      if (this.showButton) {
        Button(`默认双描边1-目前节点销毁`)
          .fontSize(16)
          .backgroundColor(Color.Blue)
          .bindMenu([
            {
              value: `菜单项1`,
              action: () => {
                hilog.info(0x0000, 'MenuExitLogic0100', `菜单项1点击`);
              }
            },
            {
              value: `菜单项2`,
              action: () => {
                hilog.info(0x0000, 'MenuExitLogic0100', `菜单项2点击`);
              }
            },
            {
              value: `菜单项3`,
              action: () => {
                hilog.info(0x0000, 'MenuExitLogic0100', `菜单项3点击`);
              }
            }
          ], {
            title: `HelloWorld`,
            showInSubWindow: false,
            enableArrow: false
          })
          .onClick(() => {
            hilog.info(0x0000, 'MenuExitLogic0100', `按钮点击，5秒后销毁`);
            this.destroyTimer = setTimeout(() => {
              hilog.info(0x0000, 'MenuExitLogic0100', `开始销毁按钮`);
              this.showButton = false;
            }, 5000);
          })
          .id('MenuExitLogic0100_DestroyButton')
      } else {
        Text(`按钮已销毁`)
          .fontSize(18)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Bold)
      }

      Text(`预期结果：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Text(`• 点击按钮后菜单弹出\n• 5秒后按钮和菜单同时消失`)
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 40 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}

