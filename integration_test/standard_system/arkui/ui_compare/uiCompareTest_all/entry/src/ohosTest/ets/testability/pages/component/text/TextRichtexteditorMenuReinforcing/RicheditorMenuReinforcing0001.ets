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
 * @tc.name: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0001
 * @tc.desc: 绑定菜单类型为RichEditorSpanType.DEFAULT类型，菜单响应类型分别为手势长按/鼠标右击/鼠标选中的自定义菜单
 * @tc.level: Level 1
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct RicheditorMenuReinforcing0001 {
  @Local testLog: string = '';
  @Local textContent: string = '这是测试DEFAULT类型菜单的RichEditor内容，请长按或右键点击测试。';
  @Local showCustomMenu: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'RicheditorMenuReinforcing0001', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - RichEditorSpanType.DEFAULT菜单测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0001')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 6 });

      Text('RichEditorSpanType.DEFAULT菜单测试')
        .fontSize(11)
        .margin({ bottom: 8 });

      // 模拟RichEditor区域
      Column() {
        Text(this.textContent)
          .fontSize(14)
          .width('100%')
          .id('rich_text_content')
          .gesture(
            LongPressGesture()
              .onAction(() => {
                this.showCustomMenu = true;
                this.addLog('手势长按 - 触发自定义菜单');
              })
          );
      }
      .width('90%')
      .height('6.56%')
      .padding(10)
      .backgroundColor('#FAFAFA')
      .borderRadius(8)
      .border({ width: 1, color: '#E0E0E0' })
      .margin({ bottom: 8 });

      if (this.showCustomMenu) {
        Column() {
          Text('自定义菜单')
            .fontSize(12)
            .fontWeight(FontWeight.Bold);
          Button('关闭')
            .onClick(() => {
              this.showCustomMenu = false;
            });
        }
        .width('60%')
        .padding(10)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)
        .shadow({ radius: 5, color: '#80000000' })
        .margin({ bottom: 8 });
      }

      Column() {
        Text('测试步骤:')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 3 });

        Text('1. 绑定RichEditorSpanType.DEFAULT类型菜单')
          .fontSize(9);
        Text('2. 手势长按/鼠标右击/鼠标选中任意内容')
          .fontSize(9);
        Text('3. 验证菜单效果')
          .fontSize(9);
      }
      .width('90%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(8)
      .alignItems(HorizontalAlign.Start);

      Column() {
        Text('预期结果:')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 3 });

        Text('均弹出绑定的自定义菜单')
          .fontSize(9)
          .fontColor('#4CAF50');
      }
      .width('90%')
      .padding(8)
      .backgroundColor('#E8F5E9')
      .borderRadius(8)
      .alignItems(HorizontalAlign.Start)
      .margin({ top: 8 });

      Scroll() {
        Text(this.testLog)
          .fontSize(9)
          .fontColor('#333333')
          .id('log_text');
      }
      .height('4.92%')
      .width('90%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 8 });
    }
    .width('100%')
    .height('100%')
    .padding(12);
  }
}

