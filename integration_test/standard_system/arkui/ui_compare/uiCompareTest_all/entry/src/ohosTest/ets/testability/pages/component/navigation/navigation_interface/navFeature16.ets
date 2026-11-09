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
import { MainTitleModifier1, MainTitleModifier2 } from './navFeatureUtils';

@Entry
@Component
export struct NavFeature16 {
  @State mainTitleModifier: TextModifier | null = null;
  @State mainTitleUseStyle1: boolean = true;
  @State titleMode: NavigationTitleMode = NavigationTitleMode.Full;
  private scroller: Scroller = new Scroller();

  build() {
    Navigation() {
      Scroll(this.scroller) {
        Column() {
          Text('用例编号：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0160')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 5 });

          Text('预置条件：运行demo，进入【2 ResourceStr】页面')
            .fontSize(12)
            .margin({ bottom: 10 });

          Button('mainTitle modifier"设置正常Modifier"')
            .id('mainTitleModifierBtn_16')
            .margin({ bottom: 10 })
            .onClick(() => {
              if (this.mainTitleUseStyle1) {
                this.mainTitleModifier = new MainTitleModifier1();
              } else {
                this.mainTitleModifier = new MainTitleModifier2();
              }
            });

          Row() {
            Text('mainTitle useStyle')
            Toggle({ isOn: this.mainTitleUseStyle1, type: ToggleType.Switch })
              .id('mainTitleUseStyleBtn_16')
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

          Button('Free')
            .id('freeModeBtn_16')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.titleMode = NavigationTitleMode.Free;
            });

          // 添加足够的内容以便滚动
          ForEach(Array.from<number, number>({ length: 20 }, (_: number, i: number): number => i), (item: number) => {
            Text(`内容项 ${item}`)
              .width('100%')
              .height(100)
              .backgroundColor(0xF0F0F0)
              .margin({ bottom: 10 })
          })
        }
        .width('100%')
        .padding(20)
        .backgroundColor(0xFFFFFF)
      }
      .width('100%')
      .height('100%')
      .edgeEffect(EdgeEffect.Spring)
    }
    .titleMode(this.titleMode)
    .title(
      'ResourceStr标题',
      {
        mainTitleModifier: this.mainTitleModifier ?? undefined
      }
    )
  }
}

