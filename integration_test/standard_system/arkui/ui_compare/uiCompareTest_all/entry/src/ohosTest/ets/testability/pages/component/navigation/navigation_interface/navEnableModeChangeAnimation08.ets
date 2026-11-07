/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.enableModeChangeAnimation(true);
  }
}

@Entry
@Component
export struct NavEnableModeChangeAnimation08 {
  @State showModifierScene: boolean = false;
  @State navigationMode: NavigationMode = NavigationMode.Stack;
  private modifier: NavigationModifier = new NavigationModifier();

  build() {
    Navigation() {
      Column() {
        if (!this.showModifierScene) {
          Button('modifier场景')
            .id('modifierSceneBtn_08')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.showModifierScene = true;
            });
        } else {
          Text('用例编号：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0080')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 5 });

          Text('预置条件：1、创建Navigation组件\n2、modifier模式下设置enableModeChangeAnimation为true')
            .fontSize(12)
            .margin({ bottom: 10 });

          Text('测试步骤：1、进入"Navigation支持关闭单双栏切换动效"页面\n2、点击"modifier场景"按钮\n3、连续切换点击"NavigationMode：Split"、"NavigationMode：Stack"按钮')
            .fontSize(12)
            .margin({ bottom: 10 });

          Button('NavigationMode：Split')
            .id('navigationModeSplitBtn_08')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.navigationMode = NavigationMode.Split;
            });

          Button('NavigationMode：Stack')
            .id('navigationModeStackBtn_08')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.navigationMode = NavigationMode.Stack;
            });

          Button('NavigationMode：Auto')
            .id('navigationModeAutoBtn_08')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.navigationMode = NavigationMode.Auto;
            });
        }
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .backgroundColor(0xFFFFFF)
    }
    .title('Navigation支持关闭单双栏切换动效')
    .mode(this.navigationMode)
    .attributeModifier(this.modifier)
  }
}

