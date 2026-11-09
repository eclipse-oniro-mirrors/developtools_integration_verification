/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { TextModifier } from '@kit.ArkUI';
import { EmptyTextModifier } from './navFeatureUtils';

@Entry
@Component
export struct NavFeature07 {
  @State mainTitleModifier: TextModifier | null = null;
  @State subTitleModifier: TextModifier | null = null;
  @State showSubWindow: boolean = false;
  private subWindowStack: NavPathStack = new NavPathStack();

  build() {
    Navigation() {
      Column() {
        Text('用例编号：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0070')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Button('开启子窗口')
          .id('openSubWindowBtn_07')
          .margin({ bottom: 10 })
          .onClick(() => {
            this.showSubWindow = true;
          });

        if (this.showSubWindow) {
          Navigation(this.subWindowStack) {
            Column() {
              Button('mainTitle modifier"空Modifier"')
                .id('mainTitleEmptyModifierBtn_07')
                .margin({ bottom: 10 })
                .onClick(() => {
                  this.mainTitleModifier = new EmptyTextModifier();
                });

              Button('subTitle modifier"空Modifier"')
                .id('subTitleEmptyModifierBtn_07')
                .margin({ bottom: 10 })
                .onClick(() => {
                  this.subTitleModifier = new EmptyTextModifier();
                });
            }
            .width('100%')
            .height('100%')
            .padding(20)
            .backgroundColor(0xF0F0F0)
          }
          .width('80%')
          .height('80%')
          .titleMode(NavigationTitleMode.Full)
          .title(
            { main: '子窗口主标题', sub: '子窗口副标题' },
            {
              mainTitleModifier: this.mainTitleModifier ?? undefined,
              subTitleModifier: this.subTitleModifier ?? undefined
            }
          )
        }
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .backgroundColor(0xFFFFFF)
    }
    .title('主窗口')
  }
}

