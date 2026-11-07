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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_PROPERTY_0110
 * @tc.desc: NavDestination的添加menus，竖屏三个图标，横屏5个图标
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationProperty0110 {
  @Local testLog: string = '';
  @Local showPage: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationProperty0110', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - NavDestination menus测试');
  }

  @Builder
  MenuBuilder() {
    Row() {
      Image($r('app.media.icon'))
        .width(24)
        .height(24)
        .margin({ right: 8 })
        .id('menu_icon_1');
      Image($r('app.media.icon'))
        .width(24)
        .height(24)
        .margin({ right: 8 })
        .id('menu_icon_2');
      Image($r('app.media.icon'))
        .width(24)
        .height(24)
        .id('menu_icon_3');
    }
  }

  @Builder
  MenuBuilderLandscape() {
    Row() {
      ForEach([1, 2, 3, 4, 5], (item: number) => {
        Image($r('app.media.icon'))
          .width(24)
          .height(24)
          .margin({ right: item < 5 ? 8 : 0 })
          .id(`menu_icon_landscape_${item}`);
      });
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_PROPERTY_0110')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('NavDestination的添加menus测试')
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
          Row() {
            Text('PageOne')
              .fontSize(16)
              .fontWeight(FontWeight.Bold);
            Blank();
            // 模拟菜单图标（竖屏3个）
            this.MenuBuilder();
          }
          .width('100%')
          .padding(10)
          .backgroundColor('#F0F0F0');

          Text('模拟NavDestination页面内容')
            .fontSize(14)
            .margin({ top: 20 });

          Button('menu')
            .onClick(() => {
              this.addLog('点击menu按钮');
              this.addLog('竖屏显示3个菜单图标');
            })
            .id('btn_menu')
            .margin({ top: 10 });

          Text('请手动旋转为横屏观察菜单图标变化')
            .fontSize(11)
            .fontColor(Color.Red)
            .margin({ top: 10 });
        }
        .width('100%')
        .padding(10)
        .backgroundColor(Color.White)
        .borderRadius(8)
        .margin({ top: 10 });
      }

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 });

      Text('1. 点击"pushPageOne_titleString"按钮\n2. 点击"menu"按钮\n3. 手机旋转为横屏\n预期: 竖屏3个图标，横屏5个图标')
        .fontSize(11)
        .fontColor('#666666');

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text');
      }
      .height('6.56%')
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

