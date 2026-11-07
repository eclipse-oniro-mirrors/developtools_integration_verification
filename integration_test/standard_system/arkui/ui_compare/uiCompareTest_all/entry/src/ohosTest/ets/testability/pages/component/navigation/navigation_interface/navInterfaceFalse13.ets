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

@Entry
@Component
export struct NavInterfaceFalse13 {
  private pathStack: NavPathStack = new NavPathStack();
  @State showButtons: boolean = false;

  build() {
    Navigation(this.pathStack) {
      Column() {
        Text('用例编号：SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0130')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('预置条件：1、创建Navigation组件 2、栈调用pushDestination方法')
          .fontSize(12)
          .margin({ bottom: 10 });

        Button('Navigation组件栈异常值操作')
          .id('openBtn_13')
          .margin({ bottom: 10 })
          .onClick(() => {
            this.showButtons = true;
          });

        if (this.showButtons) {
          Button('pushDestination animated为null')
            .id('pushDestinationAnimatedNullBtn_13')
            .margin({ bottom: 10 })
            .onClick(() => {
              try {
                this.pathStack.pushDestination({ name: 'pageOne' }, { animated: null  });
              } catch (e) {
                console.error('pushDestination animated null error:', e);
              }
            });

          Button('pushDestination animated为undefined')
            .id('pushDestinationAnimatedUndefinedBtn_13')
            .margin({ bottom: 10 })
            .onClick(() => {
              try {
                this.pathStack.pushDestination({ name: 'pageOne' }, { animated: undefined  });
              } catch (e) {
                console.error('pushDestination animated undefined error:', e);
              }
            });
        }
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .backgroundColor(0xFFFFFF)
    }
    .title('Navigation栈操作异常值测试')
    .navDestination(pageOneBuilder)
  }
}

@Builder
export function pageOneBuilder(name: string, param: Object) {
  Column() {
    Text('Page One')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
  }
  .width('100%')
  .height('100%')
  .justifyContent(FlexAlign.Center)
}

