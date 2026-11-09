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
import { MainTitleModifier1 } from './navFeatureUtils';

@Entry
@Component
export struct NavFeature19 {
  @State mainTitleModifier: TextModifier | null = null;

  build() {
    Navigation() {
      Column() {
        Text('用例编号：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_0190')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('预置条件：运行demo，进入【2 ResourceStr】页面')
          .fontSize(12)
          .margin({ bottom: 10 });

        Button('mainTitle modifier"设置正常Modifier"')
          .id('mainTitleModifierBtn_19')
          .margin({ bottom: 10 })
          .onClick(() => {
            this.mainTitleModifier = new MainTitleModifier1();
          });

        Button('设为null')
          .id('nullBtn_19')
          .margin({ bottom: 10 })
          .onClick(() => {
            this.mainTitleModifier = null;
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .backgroundColor(0xFFFFFF)
    }
    .title(
      'ResourceStr标题',
      {
        mainTitleModifier: this.mainTitleModifier ?? undefined
      }
    )
  }
}

