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
import { MainTitleModifier1, SubTitleModifier1 } from './navFeatureUtils';

@Entry
@Component
export struct NavFeature05 {
  @State mainTitleModifier: TextModifier | null = null;
  @State subTitleModifier: TextModifier | null = null;
  @State enableSubTitle: boolean = true;

  build() {
    Navigation() {
      Column() {
        Text('用例编号：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0050')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('预置条件：运行demo，进入【1 NavigationCommonTitle】页面，Full模式')
          .fontSize(12)
          .margin({ bottom: 10 });

        Button('mainTitle modifier"设置正常Modifier"')
          .id('mainTitleModifierBtn_05')
          .margin({ bottom: 10 })
          .onClick(() => {
            this.mainTitleModifier = new MainTitleModifier1();
          });

        Button('subTitle modifier"设置正常Modifier"')
          .id('subTitleModifierBtn_05')
          .margin({ bottom: 10 })
          .onClick(() => {
            this.subTitleModifier = new SubTitleModifier1();
          });

        Button('enableSubTitle')
          .id('enableSubTitleBtn_05')
          .margin({ bottom: 10 })
          .onClick(() => {
            this.enableSubTitle = !this.enableSubTitle;
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .backgroundColor(0xFFFFFF)
    }
    .titleMode(NavigationTitleMode.Full)
    .title(
      { main: '主标题', sub: this.enableSubTitle ? '副标题' : '' },
      {
        mainTitleModifier: this.mainTitleModifier ?? undefined,
        subTitleModifier: this.enableSubTitle ? (this.subTitleModifier ?? undefined) : undefined
      }
    )
  }
}

