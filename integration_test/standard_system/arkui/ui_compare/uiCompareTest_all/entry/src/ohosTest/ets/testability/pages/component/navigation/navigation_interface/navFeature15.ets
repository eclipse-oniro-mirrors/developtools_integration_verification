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

@Builder
export function navDestinationPage15Builder(name: string, param: Object) {
  NavDestinationPage15()
}

@Component
export struct NavDestinationPage15 {
  @State mainTitleModifier: TextModifier | null = null;
  @State subTitleModifier: TextModifier | null = null;
  @State mainTitleUseStyle1: boolean = true;
  @State subTitleUseStyle1: boolean = true;
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
        Text('用例编号：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0150')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Button('mainTitle modifier"设置正常Modifier"')
          .id('mainTitleModifierBtn_15')
          .margin({ bottom: 10 })
          .onClick(() => {
            if (this.mainTitleUseStyle1) {
              this.mainTitleModifier = new MainTitleModifier1();
            } else {
              this.mainTitleModifier = new MainTitleModifier2();
            }
          });

        Button('subTitle modifier"设置正常Modifier"')
          .id('subTitleModifierBtn_15')
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
            .id('mainTitleUseStyleBtn_15')
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
            .id('subTitleUseStyleBtn_15')
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
      .backgroundColor(0xFFFFFF)
    }
    .title(
      { main: 'NavDestination主标题', sub: 'NavDestination副标题' },
      {
        mainTitleModifier: this.mainTitleModifier ?? undefined,
        subTitleModifier: this.subTitleModifier ?? undefined
      }
    )
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

@Entry
@Component
export struct NavFeature15 {
  private pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {
      Column() {
        Button('push')
          .id('pushBtn_15')
          .margin({ bottom: 10 })
          .onClick(() => {
            this.pathStack.pushPath({ name: 'NavDestinationPage15' });
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .backgroundColor(0xFFFFFF)
    }
    .navDestination(navDestinationPage15Builder)
    .title('主页面')
  }
}

