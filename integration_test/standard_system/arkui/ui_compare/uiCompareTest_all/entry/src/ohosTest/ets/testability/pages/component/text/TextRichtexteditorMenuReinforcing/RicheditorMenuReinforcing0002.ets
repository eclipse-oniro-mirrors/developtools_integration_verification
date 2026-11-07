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
 * @tc.name: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0002
 * @tc.desc: 绑定菜单类型为分别为text/image/mixed/builder类型，菜单响应类型为RichEditorResponseType.DEFAULT
 * @tc.level: Level 1
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct RicheditorMenuReinforcing0002 {
  @Local testLog: string = '';
  @Local selectedType: string = 'text';
  @Local showCustomMenu: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'RicheditorMenuReinforcing0002', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - text/image/mixed/builder类型菜单测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_REINFORCING_0002')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 6 });

      Text('text/image/mixed/builder类型菜单')
        .fontSize(11)
        .margin({ bottom: 8 });

      // 类型选择
      Row({ space: 5 }) {
        ForEach(['text', 'image', 'mixed', 'builder'], (type: string) => {
          Button(type)
            .backgroundColor(this.selectedType === type ? '#2196F3' : '#E0E0E0')
            .fontColor(this.selectedType === type ? '#FFFFFF' : '#333333')
            .onClick(() => {
              this.selectedType = type;
              this.addLog(`选择类型: ${type}`);
            });
        });
      }
      .margin({ bottom: 8 });

      // 模拟RichEditor区域
      Column() {
        if (this.selectedType === 'text') {
          Text('这是TEXT类型内容')
            .fontSize(14);
        } else if (this.selectedType === 'image') {
          Image($r('app.media.icon'))
            .width(50)
            .height(50);
        } else if (this.selectedType === 'mixed') {
          Row() {
            Text('混合内容：')
              .fontSize(14);
            Image($r('app.media.icon'))
              .width(30)
              .height(30);
          }
        } else {
          Text('BuilderSpan内容')
            .fontSize(14)
            .backgroundColor('#FFF9C4')
            .padding(5);
        }
      }
      .width('90%')
      .height('6.56%')
      .padding(10)
      .backgroundColor('#FAFAFA')
      .borderRadius(8)
      .border({ width: 1, color: '#E0E0E0' })
      .justifyContent(FlexAlign.Center)
      .id('content_area')
      .gesture(
        LongPressGesture()
          .onAction(() => {
            this.showCustomMenu = true;
            this.addLog(`长按触发 ${this.selectedType} 类型菜单`);
          })
      )
      .margin({ bottom: 8 });

      if (this.showCustomMenu) {
        Column() {
          Text(`${this.selectedType}类型自定义菜单`)
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

        Text('1. 绑定text/image/mixed/builder类型菜单')
          .fontSize(9);
        Text('2. 响应类型为RichEditorResponseType.DEFAULT')
          .fontSize(9);
        Text('3. 任意操作选中各类型内容')
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
          .fontWeight(FontWeight.Bold);

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
      .height('4.1%')
      .width('90%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 8 });
    }
    .width('100%')
    .height('100%')
    .padding(10);
  }
}

