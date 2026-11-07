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
import { MainTitleModifier1, MainTitleModifier2, SubTitleModifier1, SubTitleModifier2 } from './navFeatureUtils';

@Entry
@Component
export struct NavFeature06 {
  @State mainTitleModifier: TextModifier | null = null;
  @State subTitleModifier: TextModifier | null = null;
  @State mainTitleUseStyle1: boolean = true;
  @State subTitleUseStyle1: boolean = true;
  @State showSubWindow: boolean = false;
  private subWindowStack: NavPathStack = new NavPathStack();

  build() {
    Navigation() {
      Column() {
        Text('用例编号：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0060')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('预置条件：运行demo，进入【1 NavigationCommonTitle】页面，点击"开启子窗口"')
          .fontSize(12)
          .margin({ bottom: 10 });

        Button('开启子窗口')
          .id('openSubWindowBtn_06')
          .margin({ bottom: 10 })
          .onClick(() => {
            this.showSubWindow = true;
          });

        if (this.showSubWindow) {
          Navigation(this.subWindowStack) {
            Column() {
              Button('mainTitle modifier"设置正常Modifier"')
                .id('mainTitleModifierBtn_06')
                .margin({ bottom: 10 })
                .onClick(() => {
                  if (this.mainTitleUseStyle1) {
                    this.mainTitleModifier = new MainTitleModifier1();
                  } else {
                    this.mainTitleModifier = new MainTitleModifier2();
                  }
                });

              Button('subTitle modifier"设置正常Modifier"')
                .id('subTitleModifierBtn_06')
                .margin({ bottom: 10 })
                .onClick(() => {
                  if (this.subTitleUseStyle1) {
                    this.subTitleModifier = new SubTitleModifier1();
                  } else {
                    this.subTitleModifier = new SubTitleModifier2();
                  }
                });

              Row() {
                Text('mainTitle useStyle')
                Toggle({ isOn: this.mainTitleUseStyle1, type: ToggleType.Switch })
                  .id('mainTitleUseStyleBtn_06')
                  .onChange((isOn: boolean) => {
                    this.mainTitleUseStyle1 = isOn;
                    if (this.mainTitleModifier) {
                      if (isOn) {
                        this.mainTitleModifier = new MainTitleModifier1();
                      } else {
                        this.mainTitleModifier = new MainTitleModifier2();
                      }
                    }
                  })
              }
              .margin({ bottom: 10 })
              .justifyContent(FlexAlign.SpaceBetween)
              .width('100%')

              Row() {
                Text('subTitle useStyle')
                Toggle({ isOn: this.subTitleUseStyle1, type: ToggleType.Switch })
                  .id('subTitleUseStyleBtn_06')
                  .onChange((isOn: boolean) => {
                    this.subTitleUseStyle1 = isOn;
                    if (this.subTitleModifier) {
                      if (isOn) {
                        this.subTitleModifier = new SubTitleModifier1();
                      } else {
                        this.subTitleModifier = new SubTitleModifier2();
                      }
                    }
                  })
              }
              .margin({ bottom: 10 })
              .justifyContent(FlexAlign.SpaceBetween)
              .width('100%')
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

