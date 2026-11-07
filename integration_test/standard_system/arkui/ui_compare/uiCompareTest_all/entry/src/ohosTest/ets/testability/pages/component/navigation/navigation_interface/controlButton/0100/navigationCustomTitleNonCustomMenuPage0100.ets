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

/**
 * NavigationCustomTitleNonCustomMenuPage0100
 * 
 * 标题内容是NavigationCustomTitle类型的页面（非自定义菜单）
 */

@Builder
export function navigationCustomTitleNonCustomMenuPage0100Builder(name: string, param: Object) {
  NavigationCustomTitleNonCustomMenuPage0100()
}

@Component
export struct NavigationCustomTitleNonCustomMenuPage0100 {
  @State titleText: string = 'NavigationCustomTitle类型短标题';
  pathStack: NavPathStack = new NavPathStack();

  @Builder
  CustomTitleBuilder() {
    Text(this.titleText)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .fontColor('#182431')
  }

  build() {
    NavDestination() {
      Column() {
        Button('NavigationCustomTitle类型短标题')
          .id('shortTitleBtn0100')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.titleText = 'NavigationCustomTitle类型短标题';
          });

        Button('NavigationCustomTitle类型超长标题')
          .id('longTitleBtn0100')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.titleText = 'NavigationCustomTitle类型超长标题NavigationCustomTitle类型超长标题NavigationCustomTitle类型超长标题NavigationCustomTitle类型超长标题NavigationCustomTitle类型超长标题';
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
    }
    .title({ builder: this.CustomTitleBuilder, height: 56 })
    .menus([
      { value: 'Menu1', icon: $r('sys.media.ohos_ic_public_add') },
      { value: 'Menu2', icon: $r('sys.media.ohos_ic_public_add') }
    ])
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

