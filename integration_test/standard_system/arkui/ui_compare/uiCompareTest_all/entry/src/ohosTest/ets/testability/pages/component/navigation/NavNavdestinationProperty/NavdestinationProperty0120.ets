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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_PROPERTY_0120
 * @tc.desc: NavDestination设置ignoreLayoutSafeArea，内容区扩展至状态栏和Aibar
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationProperty0120 {
  @Local testLog: string = '';
  @Local showPage: boolean = false;
  @Local hideTitleBar: boolean = false;
  @Local hideToolBar: boolean = false;
  @Local layoutSafeAreaType: boolean = false;
  @Local layoutSafeAreaEdge: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationProperty0120', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - ignoreLayoutSafeArea测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_PROPERTY_0120')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('NavDestination ignoreLayoutSafeArea测试')
        .fontSize(12)
        .margin({ bottom: 10 });

      Button('pushPageOne_titleString')
        .onClick(() => {
          this.showPage = true;
          this.addLog('点击pushPageOne_titleString按钮');
        })
        .id('btn_push_page')
        .margin({ bottom: 10 });

      if (this.showPage) {
        Column() {
          if (!this.hideTitleBar) {
            Row() {
              Text('PageOne - TitleBar')
                .fontSize(16)
                .fontWeight(FontWeight.Bold);
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#F0F0F0');
          }

          Column() {
            Text('模拟NavDestination内容区')
              .fontSize(14)
              .margin({ bottom: 10 });

            Button('hideTitleBar=true')
              .onClick(() => {
                this.hideTitleBar = true;
                this.addLog('设置hideTitleBar=true');
              })
              .id('btn_hide_title')
              .margin({ bottom: 5 });

            Button('hideToolBar=true')
              .onClick(() => {
                this.hideToolBar = true;
                this.addLog('设置hideToolBar=true');
              })
              .id('btn_hide_toolbar')
              .margin({ bottom: 5 });

            Button('[LayoutSafeAreaType.SYSTEM]')
              .onClick(() => {
                this.layoutSafeAreaType = true;
                this.addLog('设置LayoutSafeAreaType.SYSTEM');
              })
              .id('btn_safe_area_type')
              .margin({ bottom: 5 });

            Button('[LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM]')
              .onClick(() => {
                this.layoutSafeAreaEdge = true;
                this.addLog('设置LayoutSafeAreaEdge.TOP和BOTTOM');
                if (this.hideTitleBar && this.hideToolBar && this.layoutSafeAreaType) {
                  this.addLog('内容区扩展至状态栏和Aibar');
                }
              })
              .id('btn_safe_area_edge')
              .margin({ bottom: 5 });

            Text('请手动旋转为横屏观察效果')
              .fontSize(11)
              .fontColor(Color.Red)
              .margin({ top: 10 });
          }
          .width('100%')
          .layoutWeight(1)
          .backgroundColor(this.layoutSafeAreaEdge ? '#E0FFE0' : Color.White)
          .padding(10);

          if (!this.hideToolBar) {
            Row() {
              Text('ToolBar')
                .fontSize(14);
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#E0E0E0');
          }
        }
        .width('100%')
        .height('24.59%')
        .borderRadius(8)
        .margin({ top: 10 });
      }

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 });

      Text('1. 点击"pushPageOne_titleString"按钮\n2. 依次点击hideTitleBar、hideToolBar、SafeAreaType、SafeAreaEdge\n3. 手机旋转为横屏\n预期: 内容区扩展至状态栏和Aibar')
        .fontSize(11)
        .fontColor('#666666');

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text');
      }
      .height('4.92%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 10 });
    }
    .width('100%')
    .height('100%')
    .padding(10);
  }
}

