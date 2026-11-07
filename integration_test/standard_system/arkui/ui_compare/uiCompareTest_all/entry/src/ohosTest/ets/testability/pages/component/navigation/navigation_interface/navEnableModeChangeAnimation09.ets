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

@Entry
@Component
export struct NavEnableModeChangeAnimation09 {
  @State showBasicScene: boolean = false;
  @State enableModeChangeAnimation: boolean | null | undefined = undefined;
  @State navigationMode: NavigationMode = NavigationMode.Stack;

  build() {
    Navigation() {
      Column() {
        if (!this.showBasicScene) {
          Button('基础场景')
            .id('basicSceneBtn_09')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.showBasicScene = true;
            });
        } else {
          Text('用例编号：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ENABLEMODECHANGEANIMATION_0090')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 5 });

          Text('预置条件：1、创建Navigation组件')
            .fontSize(12)
            .margin({ bottom: 10 });

          Text('测试步骤：1、进入"Navigation支持关闭单双栏切换动效"页面\n2、点击"基础场景"按钮\n3、点击"enableModeChangeAnimation：xx"按钮，设置为false\n4、连续切换点击"NavigationMode：Split"、"NavigationMode：Auto"\n5、竖屏转横屏\n6、点击"enableModeChangeAnimation：xx"按钮，设置为true\n7、连续切换点击"NavigationMode：Stack"、"NavigationMode：Split"')
            .fontSize(12)
            .margin({ bottom: 10 });

          Button('enableModeChangeAnimation：true')
            .id('enableModeChangeAnimationTrueBtn_09')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.enableModeChangeAnimation = true;
            });

          Button('enableModeChangeAnimation：false')
            .id('enableModeChangeAnimationFalseBtn_09')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.enableModeChangeAnimation = false;
            });

          Button('enableModeChangeAnimation：undefined')
            .id('enableModeChangeAnimationUndefinedBtn_09')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.enableModeChangeAnimation = undefined;
            });

          Button('enableModeChangeAnimation：null')
            .id('enableModeChangeAnimationNullBtn_09')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.enableModeChangeAnimation = null;
            });

          Button('NavigationMode：Split')
            .id('navigationModeSplitBtn_09')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.navigationMode = NavigationMode.Split;
            });

          Button('NavigationMode：Stack')
            .id('navigationModeStackBtn_09')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.navigationMode = NavigationMode.Stack;
            });

          Button('NavigationMode：Auto')
            .id('navigationModeAutoBtn_09')
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
    .enableModeChangeAnimation(this.enableModeChangeAnimation === undefined ? true : (this.enableModeChangeAnimation === null ? true : this.enableModeChangeAnimation))
  }
}

